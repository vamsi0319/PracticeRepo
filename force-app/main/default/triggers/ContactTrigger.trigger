trigger ContactTrigger on Contact (after insert,after update,after delete) {
	Set<Id> AccId = new Set<Id>();
    List<Account> accList = new List<Account>();
    
    if(Trigger.isInsert||Trigger.isUpdate){
        for(Contact c:Trigger.new){
            AccId.add(c.AccountId);
        }
    }
    if(Trigger.isDelete){
        for(Contact c:Trigger.old){
           AccId.add(c.AccountId);  
        }
    }
    
    for(Account a :[Select id,Number_of_contacts__c,(Select id from Contacts) from Account where id in:AccId]){
      a.Number_of_contacts__c=a.Contacts.size();  
        accList.add(a);
    }
    update accList;
}