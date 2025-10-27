public class OpportunityTriggerHandler {
    public static void updateAccountMaxMin(List<Opportunity> newOpps, Map<Id, Opportunity> oldMap, Boolean isDelete) {
        Set<Id> accountIds = new Set<Id>();
        if (!isDelete) { 
            for (Opportunity opp : newOpps) {
                if (opp.AccountId != null) {
                    accountIds.add(opp.AccountId);
                }
            }
        } else { 
            for (Opportunity oldOpp : oldMap.values()) {
                if (oldOpp.AccountId != null) {
                    accountIds.add(oldOpp.AccountId);
                }
            }
        }

        if (accountIds.isEmpty()) return; 
        List<AggregateResult> aggResults = [
            SELECT AccountId, MAX(Amount) maxAmount, MIN(Amount) minAmount
            FROM Opportunity
            WHERE AccountId IN :accountIds
            GROUP BY AccountId
        ];
        Map<Id, AggregateResult> accToAggMap = new Map<Id, AggregateResult>();
        for (AggregateResult ar : aggResults) {
            accToAggMap.put((Id) ar.get('AccountId'), ar);
        }
        List<Account> accountsToUpdate = new List<Account>();
        for (Id accId : accountIds) {
            Account acc = new Account(Id = accId);
            if (accToAggMap.containsKey(accId)) {
                acc.Max_Opp_Amount__c = (Decimal)accToAggMap.get(accId).get('maxAmount');
                acc.Min_Opp_Amount__c = (Decimal)accToAggMap.get(accId).get('minAmount');
            } else {
                acc.Max_Opp_Amount__c = null;
                acc.Min_Opp_Amount__c = null;
            }
            accountsToUpdate.add(acc);
        }
        if (!accountsToUpdate.isEmpty()) {
            update accountsToUpdate;
        }
    }
}