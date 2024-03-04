trigger Acctrigger on Account (before delete) {
	Set<Id> AccId = Trigger.oldMap.Keyset();
    List<Opportunity> OppList = [Select Id,AccountId,Name,StageName from opportunity where AccountId in:AccId and isWon=true];
    for(Account a:Trigger.old){
        for(Opportunity op:OppList){
            if(a.Id==op.AccountId){
                a.addError('Account has closed won opp');
            }
        }
    }
}