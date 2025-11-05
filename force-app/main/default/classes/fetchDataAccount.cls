public with sharing class fetchDataAccount {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList(){
        return [SELECT Id, Name, Phone, Industry FROM Account];
    }
}