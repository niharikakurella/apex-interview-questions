## When a Case is created in Salesforce, if the 'Priority' field is set to 'High' and the 'Product Type' field is not null, automatically set the 'Escalated' checkbox on the Case to true.

trigger EscalateHighPriorityCases on Case (before insert) {
    for (Case newCase : Trigger.new) {
        if (newCase.Priority == 'High' && newCase.Product_Type__c != null) {
            newCase.Escalated__c = true;
        }
    }
}
