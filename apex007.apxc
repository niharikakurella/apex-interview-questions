## Auto-generate a Case when an Opportunity is Closed-Won

trigger GenerateCaseOnOpportunityCloseWon on Opportunity (after update) {
    List<Case> casesToInsert = new List<Case>();

    for (Opportunity opp : Trigger.new) {
        if (opp.StageName == 'Closed - Won') {
            Case newCase = new Case(
                Subject = 'New Case for ' + opp.Name,
                Description = 'Opportunity ' + opp.Name + ' has been closed as Won.',
                Status = 'New'
            );
            casesToInsert.add(newCase);
        }
    }

    if (!casesToInsert.isEmpty()) {
        insert casesToInsert;
    }
}
