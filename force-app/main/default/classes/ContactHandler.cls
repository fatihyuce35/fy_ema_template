public with sharing class ContactHandler {
    
    public static void afterInsert(List<Contact> newContacts){
        List<Id> accountIds = new List<Id>();
        List <Account> accounts = [SELECT Id, Name, Number_of_Contacts__c, (SELECT Id FROM Contacts)
                                  FROM Account  
                                  WHERE Id IN : accountIds];    
        for(Contact con : newContacts){
            accountIds.add(con.AccountId);
        }
        Integer sizeofNewContacts = accountIds.size();
        Integer sizeofOldContacts = accounts.size();
        Integer TotalContacts = sizeofNewContacts + sizeofOldContacts ;

        List<Account> acc2 = [SELECT Id,Number_of_Contacts__c FROM Account];
            for (Account Acc3 : acc2) {

                acc3.Number_of_Contacts__c = TotalContacts;
                
            }
            update accounts;
        
    }
}
