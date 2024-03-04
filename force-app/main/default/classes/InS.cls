public class InS {
    public void me(){
      Institute__c i = new Institute__c(Adress__c ='banglore');
        insert i;
        ID insID = i.ID;
         Course__c c = new Course__c(Fee__c=insID,name__c='java');
        insert c;
    }
}