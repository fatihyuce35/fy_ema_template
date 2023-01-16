@RestResource(urlMapping='/OppManager/*')
global with sharing class WsOpportunityManager {
   
    @HttpPost
    global static void run(){
        Savepoint sp = Database.setSavepoint();

        try{
            RestRequest req = RestContext.request;
            String reqBody = req.requestBody.toString();
            System.debug('reqBody:' + reqBody);

            RequestWrapper wrapper = (RequestWrapper) System.JSON.deserialize(reqBody, RequestWrapper.class);

            Account acc = new Account(Source_System_Id__c = wrapper.accId,
                                       Name = wrapper.accName
                                       );

            upsert acc Account.Fields.Source_System_Id__c;

            Opportunity opp = new Opportunity(Source_System_Id__c = wrapper.oppId,
                                              Name = wrapper.oppName,
                                              Amount = wrapper.amount,
                                              CloseDate = wrapper.closeDate,
                                              StageName = wrapper.stage
                                              );

            upsert acc Account.Fields.Source_System_Id__c;

        }catch(Exception exc){
            system.debug('EXC:' + exc.getMessage());
        }
    }

    public class RequestWrapper {

        public String accId;
        public String accName;
        public String oppId;
        public String oppName;
        public Decimal amount;
        public Date closeDate;
        public String stage;

    }
    global class SFResult {

        global Boolean success;
        global String message;
        global String accId;
        global String oppId;

        // Error Constructor
        global SFResult(String message){
            this.message = message;
            this.success = false;

        }
        // Success Constructor
        global SFResult(String accId, String oppId){
            this.success = true;
            this.accId = accId;
            this.oppId = oppId;
        }

    }
}
