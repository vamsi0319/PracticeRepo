@isTest
private class LeadHelperUT {

    static testMethod void ValidateLeadhelper(){
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
        
        Lead l = new Lead();
        l.Branch_Lookup__c=bl.id;
        l.OwnerId= us.Id;
        l.Type__c='Inbound';
        l.LastName='test';
        l.Company='testCompany';
        l.Status='	Open - Not Contacted';
        l.Title ='new';
        insert l;
        
    }
}