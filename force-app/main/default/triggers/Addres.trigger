trigger Addres on Contact (before insert) {
    List<Account> accList = new List<Account>();
    for(Contact c:Trigger.new){
        if(Trigger.isInsert){
            Account a = new Account(BillingCity=c.MailingCity,BillingCountry=c.MailingCountry,BillingPostalCode=c.MailingPostalCode,BillingState=c.MailingState,Id=c.AccountId);
            accList.add(a);
        }
    }
    update accList;
}