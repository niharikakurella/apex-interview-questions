## Prevent the deletion of an Opportunity if it's in the "Closed Won" stage.

trigger PreventDelete on Opportunity (before delete) {
    for (Opportunity opp : Trigger.old) {
        if (opp.StageName == 'Closed Won') {
            opp.addError('Cannot delete Opportunity in "Closed Won" stage.');
        }
    }
}

