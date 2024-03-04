trigger PhoneNumberisEmpty on Account (before insert) {
    List<Account> accList = (List<Account>) trigger.new;
    List<Account> acList = new List<Account>();
    for(Account acc:accList){
        if(acc.phone==null){
            acc.phone='999999';   
        }
    }
}