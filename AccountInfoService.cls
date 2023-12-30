# Write an Apex class that implements a REST web service to retrieve information about a specific Account by its Id.

@RestResource(urlMapping='/accountInfo/*')
global with sharing class AccountInfoService {
    @HttpGet
    global static String doGet() {
        String accountId = RestContext.request.params.get('id');
        Account acc = [SELECT Id, Name, Industry FROM Account WHERE Id = :accountId LIMIT 1];
        return JSON.serialize(acc);
    }
}
