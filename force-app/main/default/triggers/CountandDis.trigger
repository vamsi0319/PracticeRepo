trigger CountandDis on Device__c (after insert,after update,after delete) {
        List<Id> appId = new List<Id>();
        List<Apple__c> apList = new List<Apple__c>();
        
        if(Trigger.isinsert){
                for(Device__c d:trigger.new){
                    if(d.Apple_device_id__c!=null){
                       appId.add(d.Apple_device_id__c);
                    }
                }
            }
         if(Trigger.isdelete){
                for(Device__c d:trigger.old){
                    if(d.Apple_device_id__c!=null){
                       appId.add(d.Apple_device_id__c);
                    }
                }
            }
            
        List<Apple__c> appList = [SELECT Description__c,No_of_iPads__c,No_of_iPhones__c,No_of_iWatches__c,(SELECT Apple_device_id__c,Description__c,Device_Type__c FROM Devices__r) FROM Apple__c where id in:appId];
            for(Apple__c ap:appList){
                 Integer l,n,m=0;
                for(Device__c d:ap.Devices__r){
                    if(d.Device_Type__c=='iPhone'){
                        l++;
                    }else if(d.Device_Type__c=='iPad'){
                        m++;
                    }else if(d.Device_Type__c=='iWatch'){
                        n++;
                    }
                }
                ap.No_of_iPads__c=m;
                ap.No_of_iPhones__c=l;
                ap.No_of_iWatches__c=n;
                apList.add(ap);
            }
            update apList;
}