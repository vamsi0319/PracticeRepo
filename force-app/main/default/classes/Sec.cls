public class Sec {
    public void m1(){
        List<Contact> c = [select id,name,Title,Phone,account.name,account.site,account.rating from contact];
        List<Contact> conl = new List<Contact>();
        List<Account> acc= new List<Account>();
        
        for(Contact con:c){
            try{
            system.debug(con);
            system.debug('account details ' + con.Account);
            conl.add(con);
        con.Account.site ='california';
        con.Account.name='xyz';
            acc.add(con.account);
        } 
            catch(Exception e){
            System.debug('exception occured');
        } 
        }   
       update conl; 
       update acc;
    }
}