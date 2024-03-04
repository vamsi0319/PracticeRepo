public class Test {
    public void soq(){
        List<Account> lst= [SELECT Name,AccountNumber,(SELECT Department,Email FROM Contacts)FROM Account Limit 10];
        System.debug(lst);
        List<Contact> l2 = [Select name,(Select ContactId from OpportunityContactRoles) from contact];
        System.debug(l2);
        List<Contact> l3 = [Select AccountId,(Select ContactId from OpportunityContactRoles) from Contact];
        System.debug(l3);
        List<Account> l4= [select name,(select name from opportunities),
                           				(SELECT Department,Email FROM Contacts) from account limit 1];
        system.debug(l4);
        
    }
    public void soqc(){
        List<Contact> c= [Select name,Account.name from contact];
        System.debug(c);
        List<Contact> c1=[select id,LastName,AccountId,Account.Name from contact];
        System.debug(c1);
        List<Contact> c2=[Select FirstName,LastName,Account.Industry from contact];
        System.debug(c2);
        List<Opportunity> c4 =[select AccountId,Amount,OrderNumber__c,Account.name from opportunity];
        System.debug(c4);
        
    }
}