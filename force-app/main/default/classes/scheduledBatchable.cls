global class scheduledBatchable implements Schedulable {
   global void execute(SchedulableContext sc) {
      OppBatch b = new OppBatch(); 
      database.executebatch(b);
   }
}