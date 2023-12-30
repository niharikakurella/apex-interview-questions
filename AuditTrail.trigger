## Log deleted records in a custom object for tracking changes.

trigger AuditTrail on CustomObject__c (before delete) {
    List<AuditLog__c> auditLogs = new List<AuditLog__c>();
    
    for (CustomObject__c record : Trigger.old) {
        AuditLog__c log = new AuditLog__c();
        log.Action__c = 'Delete';
        log.RecordId__c = record.Id;
        auditLogs.add(log);
    }
    
    insert auditLogs;
}
