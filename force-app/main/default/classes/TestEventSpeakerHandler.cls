@isTest
private class TestEventSpeakerHandler {

    @testSetup
    static void prepareData(){
        Event_Organizer__c organizer = new Event_Organizer__c (Name = 'Organizer 1', 
                                                              Email__c = 'testorganizer1@test.com', 
                                                              Phone__c = '123456789'
                                                              );
        insert organizer;

       Event__c event = new Event__c(Event_Organizer__c = organizer.Id,
                                     Name__c = 'Test Event',
                                     Status__c = 'In Progress',
                                     Start_Date_Time__c = Datetime.now().addDays(-14),
                                     End_Date_Time__c = Datetime.now().addDays(14),
                                     Max_Seats__c = 10,
                                     Event_Type__c = 'Virtual',
                                     Live__c = true
                                     );        
        insert event;

        Speaker__c speaker1 = new Speaker__c(Name ='Speaker 1',
                                             Email__c = 'speaker@gmail.com',
                                             Phone__c = '123456789'
                                             );                         

        Speaker__c speaker2 = new Speaker__c(Name ='Speaker 2',
                                             Email__c = 'speaker2@gmail.com',
                                             Phone__c = '123456789'
                                             );                         
        insert new List<Speaker__c>{speaker1,speaker2};

        insert new Event_Speaker__c(Event__c = event.Id, Speaker__c = speaker1.Id);
    }

    @isTest
    static void testPositive(){
        Event_Speaker__c eventSpeaker = [SELECT Id, Event__c, Speaker__c FROM Event_Speaker__c LIMIT 1 ];

        Boolean isFailed = false;
        try{

        Event_Speaker__c newRecord = new Event_Speaker__c(Event__c = eventSpeaker.Event__c, Speaker__c = eventSpeaker.Speaker__c);
        insert newRecord;
        }catch(Exception exc){
            isFailed = true;
        }

        system.assert(isFailed);
    }

    @isTest
    Static void testNegative(){
        Event__c event = [SELECT Id FROM Event__c WHERE Name__c = 'Test Event' LIMIT 1];
        Speaker__c speaker2 =[SELECT Id FROM Speaker__c WHERE Name = 'S']    
    }
}
