# If an Account is deleted, you might want to delete all associated Contacts and Opportunities.

trigger CascadeDelete on Account (before delete) {
    List<Contact> relatedContacts = [SELECT Id FROM Contact WHERE AccountId IN :Trigger.old];
    List<Opportunity> relatedOpportunities = [SELECT Id FROM Opportunity WHERE AccountId IN :Trigger.old];
    
    delete relatedContacts;
    delete relatedOpportunities;
}
