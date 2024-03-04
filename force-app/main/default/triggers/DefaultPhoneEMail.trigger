trigger DefaultPhoneEMail on Account (before insert) {
    List<Account> accList = new List<Account>();
    for(Account a:Trigger.New){
       if(a.phone==null){
        a.Phone='9999943';
       }
       accList.add(a);
     }
   
}