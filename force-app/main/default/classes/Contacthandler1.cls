public with sharing class Contacthandler1 {
    public Contacthandler1() {
list<Account> listvalue = [select Id,Description from Account];
    for(Contact con: Trigger.new){
        for(Account acc:listvalue){
        if(con.AccountID==acc.Id){
            con.Description=acc.Description;
        }
    }
    }
    }
}