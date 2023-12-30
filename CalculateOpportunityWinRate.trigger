## Calculate Opportunity Win Rate on Account

trigger CalculateOpportunityWinRate on Opportunity (after insert, after update, after delete, after undelete) {
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

    List<Account> accountsToUpdate = [SELECT Id, Opportunity_Win_Rate__c FROM Account WHERE Id IN :accountIds];

    for (Account acc : accountsToUpdate) {
        Integer totalOpportunities = [SELECT COUNT() FROM Opportunity WHERE AccountId = :acc.Id];
        Integer wonOpportunities = [SELECT COUNT() FROM Opportunity WHERE AccountId = :acc.Id AND IsClosed = true];

        if (totalOpportunities > 0) {
            acc.Opportunity_Win_Rate__c = (Decimal)wonOpportunities / totalOpportunities;
        } else {
            acc.Opportunity_Win_Rate__c = 0;
        }
    }

    update accountsToUpdate;
}
