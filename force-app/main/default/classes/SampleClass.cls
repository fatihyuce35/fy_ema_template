public with sharing class SampleClass {
    public static void SampleSOQL() {

        /*List<account> listAcc = [Select id, name from account where name like '%i%'];

        for (Account list1 : listAcc) {
            system.debug(list1);
            
        }*/

        //List<Account> Liste2 = [Select id, name, accountnumber from account where AccountNumber!= NULL];

        //for (Account lst : Liste2) {
            //system.debug(lst);
            
        //}

        integer OppTotal = [Select count () from Opportunity]; 
        system.debug('Total=' +OppTotal);

      
                
            
        

        /*account acc = [select id,name from account order by CreatedDate desc limit 1];
        system.debug(acc);*/

        
        //List<account> listAcc = [select id, name from account where name = : accNameFilter];
        //system.debug('acc' + listAcc);

        //List<Contact> ContactList= [Select Id,name, Account.Name from Contact 
          //                          where Account.Industry = :ind];
                                    
        //system.debug(contactList);

        //List<account> AccContact =[Select Id, name, (select lastname from Contacts) from Account Limit 2];
        //system.debug('List =' + AccContact);

        //Account Acc = [Select Id, name, (Select lastName from Contacts) From Account Limit 1];

                    //for (Account acc1 : Acc ) {
          //              system.debug(acc);
            //            system.debug(acc.Contacts);
                        
                    //}
    }
}
