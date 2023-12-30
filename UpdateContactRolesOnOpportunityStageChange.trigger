## Update Contact Roles on Opportunity Stage Change

trigger UpdateContactRolesOnOpportunityStageChange on Opportunity (after update) {
    List<ContactRole> contactRolesToUpdate = new List<ContactRole>();

    for (Opportunity opp : Trigger.new) {
        Opportunity oldOpp = Trigger.oldMap.get(opp.Id);

        // Check if the Stage has changed to 'Closed - Won'
        if (opp.StageName == 'Closed - Won' && oldOpp.StageName != 'Closed - Won') {
            // Retrieve Contact Roles related to the Opportunity
            List<ContactRole> contactRoles = [SELECT Id, Role FROM ContactRole WHERE OpportunityId = :opp.Id];

            // Update Contact Role records
            for (ContactRole role : contactRoles) {
                role.Role = 'Primary Decision Maker'; // Modify this as needed
                contactRolesToUpdate.add(role);
            }
        }
    }

    if (!contactRolesToUpdate.isEmpty()) {
        update contactRolesToUpdate;
    }
}
