## Log Changes to Account Custom Fields

trigger LogAccountFieldChanges on Account (before update) {
    List<AccountHistory__c> accountHistoryRecords = new List<AccountHistory__c>();

    for (Account newAccount : Trigger.new) {
        Account oldAccount = Trigger.oldMap.get(newAccount.Id);

        // Compare custom fields
        if (newAccount.Custom_Field__c != oldAccount.Custom_Field__c) {
            AccountHistory__c historyRecord = new AccountHistory__c(
                AccountId = newAccount.Id,
                Field_Name__c = 'Custom_Field__c',
                Old_Value__c = String.valueOf(oldAccount.Custom_Field__c),
                New_Value__c = String.valueOf(newAccount.Custom_Field__c)
            );
            accountHistoryRecords.add(historyRecord);
        }
        // Add additional conditions and fields as needed
    }

    insert accountHistoryRecords;
}
