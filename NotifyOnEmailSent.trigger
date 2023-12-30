## Notify the record owner when an email is sent related to their record.

trigger NotifyOnEmailSent on EmailMessage (after insert) {
    List<UserNotification__c> notifications = new List<UserNotification__c>();
    
    for (EmailMessage email : Trigger.new) {
        UserNotification__c notification = new UserNotification__c();
        notification.UserId__c = email.RelatedTo.OwnerId;
        notification.Message__c = 'An email has been sent regarding your record.';
        notifications.add(notification);
    }
    
    insert notifications;
}
