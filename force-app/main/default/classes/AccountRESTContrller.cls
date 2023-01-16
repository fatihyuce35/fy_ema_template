@RestResource(urlMapping = '/fetchAllAccounts')
global class AccountRESTContrller {

    @HttpGet
    global static List<Account> querryAllAccounts(){


    RestRequest req = RestContext.request;
    Map<String,String>paraMap = req.params;
    String type = paraMap.get('type');
    String rating = paraMap.get('rating');    

    if(accountId != null) {

        return [SELECT id, name, phone, annualRevenue, BillingAddress, Industry from Account WHERE Id = :accountId AND type =: type AND rating=: rating];

    }else {
        
        return [SELECT id, name, phone, annualRevenue, BillingAddress, Industry from Account WHERE type =: type AND rating=: rating];
    
    }

    }
}

