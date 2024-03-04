public class Content {
   public void m(){
        List<Contact> conList = new List<Contact> {
   		new Contact(FirstName='vamsi',LastName='krishna',Department='Finance'),
        new Contact(FirstName='mohan',LastName='reddy',Department='Technology')};
            insert conList;
    }
       public void m1(){
        List<Account> ist = new List<Account> {
   		new Account(Name='vamsi',Industry='Finance'),
        new Account(Name='mohan',Industry='Technology')};
            insert ist;
    }
}