## Calculate Opportunity Amount Roll-up on Account

trigger UpdateAccountOpportunityAmount on Opportunity (after insert, after update, after delete, after undelete) {
    Set<Id> accountIds = new Set<Id>();

    if (Trigger.isInsert || Trigger.isUpdate || Trigger.isUndelete) {
        for (Opportunity opp : Trigger.new) {
            accountIds.add(opp.AccountId);
        }
    }

    if (Trigger.isUpdate || Trigger.isDelete) {
        for (Opportunity opp : Trigger.old) {
            accountIds.add(opp.AccountId);
        }
    }

    List<Account> accountsToUpdate = [SELECT Id, Total_Opportunity_Amount__c FROM Account WHERE Id IN :accountIds];

    for (Account acc : accountsToUpdate) {
        acc.Total_Opportunity_Amount__c = [SELECT SUM(Amount) FROM Opportunity WHERE AccountId = :acc.Id AND IsClosed = true];
    }

    update accountsToUpdate;
}
