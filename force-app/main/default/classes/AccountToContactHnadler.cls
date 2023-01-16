public with sharing class AccountToContactHnadler {
 
    public static void accountBillingToContactMailingHandler(List<Account> newList) {

        
        Set<Id> newIdset = new Set<Id>();

        for(Account es:newList){
            newIdset.add(es.Id);
        }
        
            List<Contact> relatedContacts = [SELECT id,MailingStreet,MailingCity,MailingCountry,MailingPostalCode,MailingState FROM Contact WHERE AccountId =: newIdset ];

            for(Contact con:relatedContacts){
                for(Account acc:newList){
                
                If(acc.BillingStreet != con.MailingStreet || con.MailingState != acc.BillingState ){

                    con.MailingStreet = acc.BillingStreet;
                    con.MailingState = acc.BillingState;
                    con.MailingCity = acc.BillingCity;
                    con.MailingCountry = acc.BillingCountry;
                    con.MailingPostalCode = acc.BillingPostalCode;
                }
            }

          
    }
    update relatedContacts;
}
}