## Upon the creation of a new Contact in Salesforce, if the Mailing Country is not null and equals 'United States,' set the Account's Custom Field 'US_Customer' to true.

trigger UpdateAccountOnContactCreation on Contact (after insert) {
    Set<Id> accountIdsToUpdate = new Set<Id>();
    
    for (Contact newContact : Trigger.new) {
        if (newContact.MailingCountry != null && newContact.MailingCountry == 'United States') {
            accountIdsToUpdate.add(newContact.AccountId);
        }
    }

    if (!accountIdsToUpdate.isEmpty()) {
        List<Account> accountsToUpdate = [SELECT Id, US_Customer__c FROM Account WHERE Id IN :accountIdsToUpdate];

        for (Account acc : accountsToUpdate) {
            acc.US_Customer__c = true;
        }

        update accountsToUpdate;
    }
}
