public class DemoProjectController {
    public Account acc {get;set;}
    public DemoProjectController(){
        acc =new Account();
    }
    public void CreateAccount(){
        if(acc.name == '' || acc.name == null){
           ApexPages.addmessage(new ApexPages.message(ApexPages.severity.FATAL,'Please enter Account name'));
        }
        else{
        insert acc;
        }
    }
    

}