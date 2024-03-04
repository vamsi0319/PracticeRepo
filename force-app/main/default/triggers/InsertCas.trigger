trigger InsertCas on Account (after insert,after update) {
   
       List<Case> caList = new List<Case>();
      for(Account acc:Trigger.new){
       Case c = new Case(Description='case is inserted',AccountId=acc.Id);
       caList.add(c);
       }
       insert caList;
   }