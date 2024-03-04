trigger RemainingDays on Opportunity (before insert) {
    for(Opportunity op:Trigger.new){
        date tdate=system.today();
        date lastDate= op.CloseDate;
        op.NoOfRemainingDays__c=tDate.daysBetween(lastDate);
    }
}