@RestResource(urlMapping ='/accountmgmt/')
global  class AccountMgmt {
@httpGet
    global static List<Account> getTOPAccounts(){
        List<Account> accList =[select id,industry,rating,Annualrevenue from Account where Annualrevenue!=null order by Annualrevenue limit 10];
        return accList;
    }
}