// Write an Apex class that inserts new Account records and handles any exceptions that may occur during the insertion process.

public class AccountHandler {
    public static void insertAccounts(List<Account> newAccounts) {
        try {
            insert newAccounts;
            System.debug('Accounts inserted successfully.');
        } catch (Exception e) {
            System.debug('An error occurred: ' + e.getMessage());
        }
    }
}
