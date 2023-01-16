trigger ContactTrigger on Contact (after insert) {

    If(Trigger.isAfter) {
        If(Trigger.isInsert){
            ContactHandler.afterInsert(Trigger.new);
        }
    }

}