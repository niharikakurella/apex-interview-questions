## Assigning the record to the user who created it.

trigger AssignOwnership on CustomObject__c (before insert) {
    for (CustomObject__c record : Trigger.new) {
        record.OwnerId = UserInfo.getUserId();
    }
}
