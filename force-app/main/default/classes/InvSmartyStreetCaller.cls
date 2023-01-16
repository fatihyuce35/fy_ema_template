public with sharing class InvSmartyStreetCaller {
    
        @InvocableMethod(label='SmartyStreetAPI' description='Makes an HTTP GET to Smarty.com' category='Location__c')
        public static void getAccountNames(List<Id> locationsIds) {
            makeCallout(locationsIds[0]);
          
        }

        @future(callout=true)
        private static void makeCallout(Id locId){
            try {
                

            }catch(Exception exc){
                String msg = exc.getMessage() + ' (line:' + exc.getLineNumber();
                System.debug('EXC:', +msg);
                ErrorLogHelper.createErrorLog('InvSmartyStreetCaller', 'makeCallout', msg);
            }

         
        }

    }