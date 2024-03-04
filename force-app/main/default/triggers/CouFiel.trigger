trigger CouFiel on Case (after insert,after delete,after update) {
    set<Id> accIDSet = new Set<Id>();
    List<Account> accList = new List<Account>();
    if(Trigger.isInsert){
    for(Case c : Trigger.new){
        if(c.AccountId != null){
            accIdSet.add(c.AccountId);
        }
    }
    System.debug('-----------------valid account Id------------'+accIdSet);
    
    for(Account a : [Select id,Case_Status_New__c,(select id,status from cases) from account where Id In : accIdSet]){
        
        Integer newCount1,newcount2,newcount3 = 0 ;
        System.debug('---------------related cases-----------'+a.cases);
        for(Case c :  a.cases){
            if(c.status == 'New'){
               ++newCount1;   
            }
            if(c.status == 'Working'){
                ++newcount2;
            }
            if(c.status == 'Escalated'){
                ++newcount3;
            }
        }
        a.Case_Status_New__c = newCount1;
        a.Case_Status_Working__c=newCount2;
        a.Case_Status_Escalated__c=newCount3;
        accList.add(a);
    }
    }
        if(Trigger.isDelete){
    for(Case c : Trigger.old){
        if(c.AccountId != null){
            accIdSet.add(c.AccountId);
        }
    }
    System.debug('-----------------valid account Id------------'+accIdSet);
    List<Account> accList = new List<Account>();
    for(Account a : [Select id,Case_Status_New__c,(select id,status from cases) from account where Id In : accIdSet]){
        
        Integer newCount1,newCount2,newCount3=0;
        System.debug('---------------related cases-----------'+a.cases);
        for(Case c :  a.cases){
            if(c.status == 'New'){
               ++newCount1;   
            }
            if(c.status == 'Working'){
                ++newcount2;
            }
            if(c.status == 'Escalated'){
                ++newcount3;
            }
        }
        a.Case_Status_New__c =a.Case_Status_New__c-newCount1;
        a.Case_Status_Working__c=newCount2;
        a.Case_Status_Escalated__c=newCount3;
        accList.add(a);
    }
    }
    update accList;
}