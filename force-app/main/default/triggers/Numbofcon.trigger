trigger Numbofcon on Contact (after insert,after delete,after update) {
  set<id> acc = new set<id>();
   for(contact a : Trigger.new)
   {
       acc.add(a.Accountid);
   }
   List<Account> aclist = [select id, (select id from contacts) from account where id in: acc];
   for(Account a : aclist)
   {
       a.Total_contacts__c = a.contacts.size();
   }
   update aclist;
}