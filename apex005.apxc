## Upon the creation of a new Lead in Salesforce, if the Lead Source is 'Web' and the Annual Revenue is not null and greater than $500,000, set the Industry field to 'High Value Web Lead.'

trigger UpdateLeadIndustryOnCreation on Lead (before insert) {
    for (Lead newLead : Trigger.new) {
        if (newLead.LeadSource == 'Web' && newLead.AnnualRevenue != null && newLead.AnnualRevenue > 500000) {
            newLead.Industry = 'High Value Web Lead';
        }
    }
}
