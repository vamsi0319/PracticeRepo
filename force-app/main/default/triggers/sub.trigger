trigger sub on electronic_devices__c (before insert) {
    for(electronic_devices__c ec:Trigger.new){
       ec.Subject__c='Please Check the Parts for Detailed Summary';
    }
}