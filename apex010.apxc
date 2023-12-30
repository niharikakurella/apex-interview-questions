## Enforce Unique Email Addresses for Contacts within an Account

trigger EnforceUniqueContactEmails on Contact (before insert, before update) {
    Set<String> emailAddresses = new Set<String>();
    List<Contact> contactsWithDuplicateEmails = new List<Contact>();

    for (Contact con : Trigger.new) {
        if (con.Email != null && emailAddresses.contains(con.Email)) {
            contactsWithDuplicateEmails.add(con);
        } else {
            emailAddresses.add(con.Email);
        }
    }

    for (Contact con : contactsWithDuplicateEmails) {
        con.Email.addError('Duplicate email address within the same Account is not allowed.');
    }
}
