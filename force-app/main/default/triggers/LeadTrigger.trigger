trigger LeadTrigger on Lead (before insert,before update) {
 if(trigger.isInsert){
   LeadHelperClass.LeadOwnerUpdate(Trigger.new);
 }
 if(trigger.isUpdate){
   LeadHelperClass.LeadOwnerUpdate(Trigger.new);
 }
}