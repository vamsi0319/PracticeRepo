trigger AccountTrigger on Account (before insert) {
    
    for(Account a:Trigger.New){
        a.Phone= '9665855';
    }
}