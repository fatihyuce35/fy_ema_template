@isTest
private class TestAttendeeHandler {

        @TestSetup
        static void prepareData(){
            Attendee__c TestAttendee = new Attendee__c (Name = 'Halim Kaya',
                                                     Email__c = 'yuce2@hotmail.com',
                                                     Phone__c = '123456789'
                                                     );
            insert TestAttendee;

            
        }

    
    @isTest
    static void testPositive(){
        
        Attendee__c Attendee1 = [SELECT Id, Email__c FROM Attendee__c LIMIT 1];
        Boolean isFailed = false;

        try{

        Attendee__c newRecord = new Attendee__c(Email__c = Attendee1.Email__c);
        insert newRecord;
        }catch(Exception exc){
            isFailed = true;
        }
        system.assert(isfailed);
    }
}
