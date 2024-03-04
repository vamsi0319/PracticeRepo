trigger TaskTrigger on Task (after insert,after delete,after update) {
    Set<Id> AccId = new Set<Id>();
    if(Trigger.isInsert||Trigger.isUpdate){
        for(Task t:Trigger.new){
            AccId.add(t.AccountId);
        }
    }
    
    for(Account a:[Select Id,Number_of_tasks_completed__c,Check__c,Total_Taks__c,(Select Id,Status from tasks)from Account where id in:AccId]){
       integer n =0;
        for(Task ta:a.tasks){
            if(ta.Status=='Completed'){
                n++;
            }       
        }
        a.Number_of_tasks_completed__c=n;
        if(a.Number_of_tasks_completed__c==a.tasks.size()){
            a.Check__c= true;
        }else{
            a.Check__c=false;
        }
        
    }
}