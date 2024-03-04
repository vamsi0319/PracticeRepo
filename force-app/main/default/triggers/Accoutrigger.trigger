trigger Accoutrigger on Account (before update) {
	Map<Id,Account> OldAcc=trigger.oldMap;
    for(Account a:Trigger.new){
        if(OldAcc.containsKey(a.Id)){
            if(OldAcc.get(a.Id).Rating=='Hot' && a.Rating=='Warm'){
             a.Description='Rating Changed from hot to warm';   
            }
        }
    }
}