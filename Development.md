//display contacts counts on account

trigger ContactCountSimple on Contact (after insert, after delete, after undelete) {

    Set<Id> accIds = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUndelete) {
        for(Contact c : Trigger.new) if(c.AccountId != null) accIds.add(c.AccountId);
    }
    if(Trigger.isDelete) {
        for(Contact c : Trigger.old) if(c.AccountId != null) accIds.add(c.AccountId);
    }

    List<Account> accList = [SELECT Id FROM Account WHERE Id IN :accIds];
    for(Account a : accList) {
        Integer countContacts = [SELECT COUNT() FROM Contact WHERE AccountId = :a.Id];
        a.Number_of_Contacts__c = countContacts;
    }

    update accList;
}
// display count of contacts only active
trigger ActiveContactCountSimple on Contact (after insert, after update, after delete) {

    Set<Id> accIds = new Set<Id>();
    if(Trigger.isInsert || Trigger.isUpdate) for(Contact c : Trigger.new) if(c.AccountId != null) accIds.add(c.AccountId);
    if(Trigger.isDelete) for(Contact c : Trigger.old) if(c.AccountId != null) accIds.add(c.AccountId);

    List<Account> accList = [SELECT Id FROM Account WHERE Id IN :accIds];
    for(Account a : accList) {
        Integer activeCount = [SELECT COUNT() FROM Contact WHERE AccountId = :a.Id AND Status__c = 'Active'];
        a.Active_Contacts__c = activeCount;
    }

    update accList;
}
// sum of opportunity amount on account
trigger OpportunityAmountSumSimple on Opportunity (after insert, after update, after delete) {

    // Step 1: Collect all Account IDs affected
    Set<Id> accIds = new Set<Id>();
    
    if(Trigger.isInsert || Trigger.isUpdate) {
        for(Opportunity o : Trigger.new) {
            if(o.AccountId != null)
                accIds.add(o.AccountId);
        }
    }
    
    if(Trigger.isDelete) {
        for(Opportunity o : Trigger.old) {
            if(o.AccountId != null)
                accIds.add(o.AccountId);
        }
    }

    // Step 2: Get all Accounts to update
    List<Account> accList = [SELECT Id FROM Account WHERE Id IN :accIds];

    // Step 3: Loop through each Account and calculate total Opportunity Amount
    for(Account a : accList) {
        Decimal totalAmount = 0;

        // Get all Opportunities for this Account
        List<Opportunity> oppList = [SELECT Amount FROM Opportunity WHERE AccountId = :a.Id];

        // Sum the Amount
        for(Opportunity o : oppList) {
            if(o.Amount != null)
                totalAmount += o.Amount;
        }

        // Update the Account field
        a.Total_Opportunity_Amount__c = totalAmount;
    }

    // Step 4: Update Accounts
    update accList;
}
