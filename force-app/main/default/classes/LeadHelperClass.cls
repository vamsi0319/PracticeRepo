public class LeadHelperClass {
    public static void LeadOwnerUpdate(List<Lead> le){
        List<User> userList = new List<User>();
        List<Lead> LeadList = new List<Lead>(); 
        Id taskUserId ; 
        
        for(User us:[SELECT Available_for_Leads__c,Territory__c,Id,LastName,UserRoleId,Name,Selling_Region__c FROM User]){
            userList.add(us);
        }
        Group g = [SELECT Id,Name FROM Group Where Name='Inbound Lead Queue'];
        Map<Id,Branch_Lookup__c> idBranchMap= new Map<Id,Branch_Lookup__c>();
        for(Branch_Lookup__c us :[SELECT Selling_Region__c,Territory__c,Id FROM Branch_Lookup__c]){
            idBranchMap.put(us.Id,us);
        }
             
        for(Lead lea:le){           
            for (User eachUser : userList){               
                if(lea.Type__c != null && eachUser.Available_for_Leads__c == true && lea.Branch_Lookup__c != null && idBranchMap.get(lea.Branch_Lookup__c) != null && eachUser.Territory__c ==  idBranchMap.get(lea.Branch_Lookup__c).Territory__c){
                    if(lea.Type__c=='Outbound' && eachUser.UserRoleId == '00E0K000001yylm'){
                        lea.OwnerId = eachUser.Id;
                        taskUserId = eachUser.Id;
                    }
                    /*If the type is Inbound, change the owner of the lead based on the following criteria
                    - User Role should be Inbound Sales Specialist
                    - Available for Leads should be checked*/
                    else if(lea.Type__c=='Inbound'  ){
                        if(eachUser != null && eachUser.UserRoleId == '00E0K000001yylhUAA'){
                            System.debug(lea.Id+'-----'+lea.OwnerId+'--eachUser.Territory__c-+++---->'+eachUser.Territory__c);                       
                            lea.OwnerId = eachUser.Id;
                            taskUserId = eachUser.Id;
                        }else if(eachUser == null){
                            //If no users are available for leads, then assign it to Inbound Lead queue  
                                 lea.OwnerId= g.Id;                    
                        }
                    }                       
                }else if(eachUser.UserRoleId == '00E0K000001yylr' && lea.Branch_Lookup__c != null && idBranchMap.get(lea.Branch_Lookup__c) != null && eachUser.Selling_Region__c ==  idBranchMap.get(lea.Branch_Lookup__c).Selling_Region__c){
                    //If there are no users available assign it to user with Sales Manager Role and matching Selling region
                    lea.OwnerId = eachUser.Id; 
                    taskUserId = eachUser.Id;                  
                }                                                                                 
            }                                    
        }
        if(taskUserId != null)
            CreateTaskRecord(taskUserId);        
    }
    public static void CreateTaskRecord(Id userId){
        System.debug('--*******---'+userId);
        Task taskInstance = new Task();
        taskInstance.Subject = 'Call';
        taskInstance.ActivityDate = System.today().addDays(15);
        taskInstance.OwnerId = userId;
        insert taskInstance;
    }
}