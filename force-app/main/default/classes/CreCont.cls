global class CreCont implements Database.Batchable<sObject>,Database.stateful {
    
   	global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select id,Total_contacts__c From Account where Total_contacts__c =null]);
    }
    global void execute(Database.BatchableContext bc, List<Account> records){
        List<Contact> conList = new List<Contact>();
        for(Account a:records){
            
               Contact c = new Contact(Accountid=a.id,LastName='check',created_from_batch__c=true);
               conList.add(c);
            
        }
       	insert conList;
       
    }
    global void finish(Database.BatchableContext bc){
        
    }
}