global class OppBatch implements Database.Batchable<sObject>{
    List<User> userList = new List<User>();
    Map<Id,Branch_Lookup__c> idBranchMap= new Map<Id,Branch_Lookup__c>();
    Set<Id> userIdSet = new Set<Id>();
    List<Opportunity> opportunityList = new List<Opportunity>();
    
    global OppBatch(){		
        for(Branch_Lookup__c us :[SELECT Selling_Region__c,Territory__c,Id FROM Branch_Lookup__c]){
            idBranchMap.put(us.Id,us);
        }
        for(User us:[SELECT Available_for_Leads__c,Territory__c,Id,LastName,UserRoleId,Name,Selling_Region__c FROM User]){
            userList.add(us);
        }
	}
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query ='Select id,StageName,Branch_Lookup__c from Opportunity'; 
        return Database.getQueryLocator(query);
    }
    
    global void execute(Database.BatchableContext BC, List<Opportunity> scope){
        for(Opportunity opp : scope) { 
             for (User eachUser : userList){               
                if(opp.StageName == 'Proposal/Price Quote' && eachUser.Available_for_Leads__c == true && opp.Branch_Lookup__c != null && idBranchMap.get(opp.Branch_Lookup__c) != null && eachUser.Territory__c ==  idBranchMap.get(opp.Branch_Lookup__c).Territory__c){
                    if(opp.StageName=='Proposal/Price Quote' && eachUser.UserRoleId == '00E0K000001yylm'){
                        opp.OwnerId = eachUser.Id;
                        userIdSet.add(eachUser.Id);
                    }
                }else if(eachUser.UserRoleId == '00E0K000001yylr' && opp.Branch_Lookup__c != null && idBranchMap.get(opp.Branch_Lookup__c) != null && eachUser.Selling_Region__c ==  idBranchMap.get(opp.Branch_Lookup__c).Selling_Region__c){
                    //If there are no users available assign it to user with Sales Manager Role and matching Selling region
                    opp.OwnerId = eachUser.Id; 
                    userIdSet.add(eachUser.Id);
                } 
                 
                 
             }  
            opportunityList.add(opp);
            System.debug(opp);
        }
        update opportunityList;
       
    }
    
    global void finish(Database.BatchableContext BC)    {
        List<Task> taskList = new List<Task>();
        For (Id eachId : userIdSet){
            Task taskInstance = new Task();
            taskInstance.Subject = 'Call';
            taskInstance.ActivityDate = System.today().addDays(15);
            taskInstance.OwnerId = eachId;
            taskList.add(taskInstance);
        }
        if(taskList.size() > 0){
        	insert taskList;            
        }
        Integer oppProcessed = 0;
        Integer oppWon = 0;
		Integer oppLost = 0;
        for (Opportunity opp : [Select id,StageName from Opportunity]){
            ++oppProcessed;
            if(opp.StageName == 'Closed Won' ){
               ++oppWon; 
            }
            else if(opp.StageName == 'Closed Lost' ){
               ++oppLost;
            }
            opp.StageName = 'Proposal/Price Quote';
            opportunityList.add(opp);
        }
        if(opportunityList.size() > 0){
            update opportunityList;
        }
        Profile pro = [SELECT Id FROM Profile WHERE Name = 'System Administrator'];
        System.debug(pro);
        List<User> sys_adm = [SELECT Id,Name,Email FROM User WHERE ProfileId =: pro.Id];
        List<String> toAddresses = new List<String>();
        for(User eachUser : sys_adm){
            toAddresses.add(eachUser.Email);
        }
        // Create a new Email
        List<Messaging.SingleEmailMessage> mails = new List<Messaging.SingleEmailMessage>();
        for(User eachUser : sys_adm){
            Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();    
            mail.setToAddresses(toAddresses);
            mail.setSenderDisplayName('Oppurtunities');
            mail.setSubject('Oppurtunity Status');
            String body = 'Dear '+ eachUser.Name + ',';
            body += ' Total number of oppurtunities Processed : '+oppProcessed;
            body += ' Total number of oppurtunities Closed Won	 : '+oppWon;
            body += ' Total number of oppurtunities Closed Lost	 : '+oppLost;
            mail.setHtmlBody(body);
            mails.add(mail);
        }
        Messaging.sendEmail(mails);
    }
}