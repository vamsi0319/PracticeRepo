trigger InsertAdd on Account (after insert) {
    
    List<Contact> conList = new List<Contact>();
    for(Account a:Trigger.new){
      
            Contact c = new Contact(MailingCity=a.BillingCity,MailingCountry=a.BillingCountry,MailingPostalCode=a.BillingPostalCode,MailingState=a.BillingState,AccountId=a.Id);
            conlist.add(c);
        
      
    }
      update conlist;
}