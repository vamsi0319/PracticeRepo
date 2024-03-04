@isTest
private class OppBatchUT {
    
     @isTest static void oppBatchtest(){
        List<Opportunity> oppList = new List<Opportunity>();
        Profile p =[Select Id from profile where Name='Standard User'];
        User us = new User();
        us.LastName = 'test';
        us.Alias= 'test';
        us.Email = 'test@gmail.com';
        us.CommunityNickname = 'test';
        us.EmailEncodingKey = 'ISO-8859-1';
        us.TimeZoneSidKey= 'Asia/Riyadh';
        us.LocaleSidKey= 'en_US';
        us.LanguageLocaleKey='en_US';
        us.Username='test7898988@gmail.com';
        us.ProfileId = p.id;
        insert us;
        
        Branch_Lookup__c bl = new Branch_Lookup__c();
        bl.Selling_Region__c='India';
        bl.Territory__c = 'India';
        bl.Zip__c='560076';
        bl.Name= 'india branch look up';
        Insert bl;
        
        Opportunity opp1 = new Opportunity();
        opp1.Name = 'testopp';
        opp1.StageName = 'Proposal/Price Quote';
        opp1.CloseDate = System.today().addDays(15);
        oppList.add(opp1);
         
        Opportunity opp2 = new Opportunity();
        opp2.Name = 'testopp1';
        opp2.StageName = 'Proposal/Price Quote';
        opp2.CloseDate = System.today().addDays(15);
        oppList.add(opp2);
         
        //Test.startTest();
        insert oppList;
        OppBatch op = new OppBatch();
        DataBase.executeBatch(op);
        //Test.stopTest();
        
        
        
        
    }
}