## Write an Apex trigger that updates a custom field on the Account object when a related Contact is updated.

trigger UpdateAccountCustomField on Contact (after update) {
    // Collect Account Ids related to the updated Contacts
    Set<Id> accountIds = new Set<Id>();
    
    for (Contact updatedContact : Trigger.new) {
        if (updatedContact.AccountId != null) {
            accountIds.add(updatedContact.AccountId);
        }
    }

    // Retrieve relevant Account records
    List<Account> accountsToUpdate = [SELECT Id, CustomField__c FROM Account WHERE Id IN :accountIds];

    // Update the custom field on each Account
    for (Account acc : accountsToUpdate) {
        // Your logic to update the custom field based on Contact changes
        acc.CustomField__c = 'Updated Value'; // Replace this with your actual logic
    }

    // Update the Account records
    update accountsToUpdate;
}
