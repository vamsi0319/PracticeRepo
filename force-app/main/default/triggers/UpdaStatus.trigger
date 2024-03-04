trigger UpdaStatus on electronic_devices__c (after insert) {
    Set<Id> eId = new Set<Id>();
    List<Part__c> pList = new List<Part__c>();
    for(electronic_devices__c ec : Trigger.new){
        if(ec.id!='null'){
            eId.add(ec.id);
        }
    }
    for(electronic_devices__c e : [Select Status__c,(select Status__c from Parts__r) from electronic_devices__c where id in : eId]){
    for(electronic_devices__c ec:Trigger.new){
        Part__c p = new Part__c(Status__c=ec.Status__c); 
        pList.add(p);
    }
    }
    update pList;
}