trigger AccountTrigger1 on Account (before insert) {
    
    if(Trigger.isInsert && Trigger.isBefore){
        for(Account a : Trigger.new){
            if(a.ShippingCity==null)
            a.BillingCity = a.ShippingCity;
            if(a.ShippingCountry==null)
            a.BillingCountry = a.ShippingCountry;
            if(a.ShippingState==null)
            a.BillingState= a.ShippingState;
            if(a.ShippingStreet==null)
            a.BillingStreet=a.ShippingStreet;
            if(a.ShippingPostalCode==null)
            a.BillingPostalCode=a.ShippingPostalCode;
        }
    }
}