global class OpportunitiesBatchClass implements Database.Batchable<sObject> {
    global Database.QueryLocator start(Database.BatchableContext BC){
        String query = 'Id,Name,SELECT Branch_Lookup__r.Territory__c,Branch_Lookup__r.Zip__c,Branch_Lookup__r.Selling_Region__c FROM Opportunity';
        return Database.getQueryLocator(query);
    }
    global void execute(Database.BatchableContext BC,List<Opportunity> opp){
        
    }
    
    global void finish(Database.BatchableContext BC){
    }
}