trigger Descrip on Part__c (after insert,after update) {
    set<Id> eIDSet = new Set<Id>();
    List<electronic_devices__c> eList = new List<electronic_devices__c>();
    List<Part__c> paList = new List<Part__c>();
   
    if(Trigger.isinsert){
    for( Part__c p : Trigger.new){
     if(p.device__c!= null){
            eIdSet.add(p.device__c);
        }
    }
    System.debug('--------------valid account Id-----------'+eIdSet);
    
    for(electronic_devices__c e : [Select Name__c,Status__c,Summary__c,(select Name__c,Status__c,Subject__c,Id from Parts__r) from electronic_devices__c where Id In : eIdSet]){
                System.debug('---------------related Status-----------'+e.Status__c);
                String s='';
                for(Part__c pa : e.Parts__r){
                      //e.Status__c=pa.Status__c;
                    s=('<Part Name>'+ pa.Name__c +'<Part Id> --'+ pa.Id +'<Part - Subject >--'+ pa.Subject__c)+  '\n' + s  ;
                    paList.add(pa);
                }
             e.Summary__c=s;
             eList.add(e);
    }  
    update paList;
     update eList;
    }
    }