
public with sharing class AttendeeHandler {

public static void checkDuplicateEmailOnAttendee(List<Attendee__c> newAttendees) {

    Set<String> newemails = new Set<String>();
    Set<String> oldemails = new Set<String>();

    for(Attendee__c nemail : newAttendees){
        newemails.add(nemail.Email__c); 
    }

    List<Attendee__c> onSystemRecord = [SELECT Id, Email__c from Attendee__c WHERE Email__c IN:newemails];

        for(Attendee__c oemail : onSystemRecord){
            oldemails.add(oemail.Email__c);
        }
        for(Attendee__c nemail : newAttendees ){
            if(oldemails.contains(nemail.Email__c)){
            nemail.Email__c.addError('This email has already exist please provide another email.');

            }
        }    

}
}

    
 