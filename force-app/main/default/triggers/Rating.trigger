trigger Rating on Account (before update) {
        Map<Id,Account> oldData = Trigger.oldMap;
        for(Account acc:Trigger.new){
            if(OldData.Containskey(acc.Id)){
                  if(OldData.get(acc.id).Rating=='Hot'&&acc.Rating=='Warm'){
                          acc.Description='Rating is changed from Hot to Warm';
                  }
            }
        }
}