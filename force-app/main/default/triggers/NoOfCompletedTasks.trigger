trigger NoOfCompletedTasks on Task (after insert,after update,after delete) {
        Set<Id> accId = new Set<Id>();
        List<Account> acc = new List<Account>();    
       if(Trigger.isinsert || Trigger.isupdate || Trigger.isUndelete){
               for(Task t:Trigger.new){
                   accId.add(t.AccountId);        
               }
       }
       if(Trigger.isdelete){
               for(Task t:Trigger.old){
                   accId.add(t.AccountId);        
               }
       }
       
       List<Account> accList =[SELECT Id,Number_of_tasks_completed__c,Check_Complition__c,(SELECT Id,AccountId,Status FROM Tasks) FROM Account where id in:accId];
           for(Account a:accList){
                      Integer n=0;
                      
               for(Task ts:a.Tasks) {      
                  if(ts.Status=='Completed'){
                          n++;
                  }
                  }
                  if(n==a.Tasks.size()){
                      a.Check_Complition__c=true;
                  }else{
                      a.Check_Complition__c=false;
                      }
                  a.Number_of_tasks_completed__c=n;
                  
                 acc.add(a); 
                  
           }
          update acc; 
}