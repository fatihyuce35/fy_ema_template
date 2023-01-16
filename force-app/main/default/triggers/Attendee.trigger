trigger Attendee on Attendee__c (before insert, before update) {
    
    if(Trigger.isBefore){

    if(Trigger.isInsert || Trigger.isUpdate){
        
    AttendeeHandler.checkDuplicateEmailOnAttendee(Trigger.new);

        }
    }


}