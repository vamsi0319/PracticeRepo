trigger Casestatus on Case (after insert,after update,after delete) {
       Set<Id> accId = new Set<Id>();
       List<Account> a = new List<Account>();
       if(Trigger.isinsert||Trigger.isUpdate){
           for(Case c:Trigger.new){
               accId.add(c.AccountId);
           }
       }
       if(Trigger.isdelete){
           for(Case c:Trigger.old){
               accId.add(c.AccountId);
           }
       }
       List<Account> accList=[SELECT Case_Status_Escalated__c,Case_Status_New__c,Case_Status_Working__c,Id,(SELECT AccountId,Status FROM Cases)FROM Account where id in:accId];
           for(Account acc:accList){
               Integer n=0;
               Integer m=0;
               Integer k=0;
                   for(Case c:acc.Cases){
                          if(c.status=='New'){
                                  n++;
                          }else if(c.status=='Working'){
                                  m++;
                          }else{
                                  k++;
                          } 
                   }
                acc.Case_Status_Escalated__c=k;
                acc.Case_Status_New__c=n;
                acc.Case_Status_Working__c=m;
                
                a.add(acc);   
           }
           update a;
}