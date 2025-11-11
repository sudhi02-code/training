public with sharing class SearchValue {
@AuraEnabled
    public static list<Account> getSearchValue(String input) {
        String searchValue = '%' + input + '%';
        return[SELECT Id, Name, Email, Phone FROM Account WHERE Name LIKE :searchValue LIMIT 10];
    }
}