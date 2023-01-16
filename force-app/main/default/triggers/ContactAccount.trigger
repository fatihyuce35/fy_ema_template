trigger ContactAccount on Account (after update) {

    if(Trigger.isAfter && Trigger.isUpdate){
        AccountToContactHnadler.accountBillingToContactMailingHandler(Trigger.new);

    }
    


}