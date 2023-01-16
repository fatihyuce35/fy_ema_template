public with sharing class DailyEventCleaner implements Database.Batchable<sObject>{

    public Database.QueryLocator start(Database.BatchableContext bc) {
        // collect the batches of records or objects to be passed to execute
        //Event__c
        return Database.getQueryLocator([SELECT Id
                                         FROM Event__c
                                         WHERE End_Date_Time__c <=: Datetime.now().addMonths(-2)
                                         AND Live__c = false
                                         ]);  
    }
    public void execute(Database.BatchableContext bc, List<Event__c> records){
        // process each batch of records
        delete records;
    }
    public void finish(Database.BatchableContext bc){
        List<GroupMember> members = [SELECT UserOrGroupId
                                     FROM GroupMember 
                                     WHERE Group.DeveloperName = 'Daily_Job' 
                                     ];
        // execute any post-processing operations
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        mail.setSubject('Daily Purge Event Job Has Run');
        mail.setHtmlBody('Hello, <br/><br/> Daily email job has finished.<br/>');
        mail.setToAddresses(param0);
    } 

}
