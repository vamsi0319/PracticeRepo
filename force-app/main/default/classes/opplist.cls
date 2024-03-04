public class opplist {
   
    @AuraEnabled
    public static list<opportunity> getopplist(){
        
        list<opportunity> opps = new list<opportunity>([select Id,Owner.name,AccountId,probability,stageName from opportunity Where stageName = 'Closed Won']);
        return opps;
    }
}