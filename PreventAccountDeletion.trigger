## Prevent Deletion of Important Accounts

trigger PreventAccountDeletion on Account (before delete) {
    for (Account acc : Trigger.old) {
        if (acc.Important_Account__c) {
            acc.addError('You cannot delete an important account.');
        }
    }
}
