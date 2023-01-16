trigger AnnualRevenue on Account (before insert, before update) {

    List<Account> NewAccounts = new List<Account>(Trigger.new);
    

    for(Account na: NewAccounts){
        if(na.AnnualRevenue < 500000){
            na.OwnerId='0058c00000Cth98'; //melih
        }
        else if(na.AnnualRevenue >500000 && na.AnnualRevenue<1000000){
            na.OwnerId='0058c00000Ao9DG'; // fatih
        }
        else {
            na.OwnerId='0058c00000Cth9c';
        }
        
    }

}