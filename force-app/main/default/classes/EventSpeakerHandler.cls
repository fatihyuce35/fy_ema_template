public with sharing class EventSpeakerHandler {
    
    public static void checkDuplicateSpeakerOnEvents(List<Event_Speaker__c> eventSpeakers){
    
        Map<String, Event_Speaker__c> eventSpeakersMap = new Map<String, Event_Speaker__c>();  
        Set<Id> eventIds = new Set<Id>();
        Set<Id> speakerIds = new Set<Id>();
       

        for(Event_Speaker__c es : eventSpeakers){
            String uniqueKey = String.valueOf(es.Event__c) + String.valueOf(es.Speaker__c);
            eventSpeakersMap.put(uniqueKey, es);

            eventIds.add(es.Event__c);
            speakerIds.add(es.Speaker__c);
        }
        List<Event_Speaker__c> onSystemRecords = [SELECT Id, Event__c, Speaker__c
                                                  FROM Event_Speaker__c
                                                  WHERE Event__c IN: eventIds
                                                  AND Speaker__c IN: speakerIds];


        for(Event_Speaker__c sys : onSystemRecords){
            String uniqueKey = String.valueOf(sys.Event__c) + String.valueOf(sys.Speaker__c);

            Event_Speaker__c checkingObject = eventSpeakersMap.get(uniqueKey);
        
            if(checkingObject == null) continue;
        
            checkingObject.addError('Found a duplicate Event Speaker record on the system with id:' + String.valueOf(sys.Id));          
            
        }                               

    }
}
