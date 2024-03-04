trigger UpdatingAcc on Contact (after insert) {
    Set<ID> s = new Set<ID>();
    List<Account> accList = new List<Account>();
    if(Trigger.isInsert){
     for(Contact co:Trigger.new){
     Account a = new Account(Description = 'Contact created',Id=co.Accountid);
        accList.add(a);
    }
    }
   update accList;
}