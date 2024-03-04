public class Check {
    public void sos(){
        List<List<SObject>> c = [FIND 'kris' IN NAME FIELDS RETURNING Account(Name), Contact(FirstName,LastName,Department) ];
        System.debug(c);
        List<List<SObject>> s = [FIND '12' IN PHONE FIELDS RETURNING Account(Phone), Contact(Phone)];
        system.debug(s);
        List<List<SObject>> ch = [FIND 'gsvr' IN EMAIL FIELDS RETURNING Contact(email)];
        system.debug(ch);
    }
}