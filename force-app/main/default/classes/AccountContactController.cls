public with sharing class AccountContactController {
    
    public class AccountWithContacts {
        @AuraEnabled
        public String accountId { get; set; }
        @AuraEnabled
        public String accountName { get; set; }
        @AuraEnabled
        public List<ContactInfo> contacts { get; set; }
        
        public AccountWithContacts() {
            this.contacts = new List<ContactInfo>();
        }
    }
    
    public class ContactInfo {
        @AuraEnabled
        public String contactId { get; set; }
        @AuraEnabled
        public String contactName { get; set; }
        @AuraEnabled
        public String email { get; set; }
        @AuraEnabled
        public String phone { get; set; }
    }
    
    @AuraEnabled(cacheable=true)
    public static List<AccountWithContacts> getAccountsWithContacts() {
        List<AccountWithContacts> result = new List<AccountWithContacts>();
        
        // Query Accounts with their related Contacts
        List<Account> accounts = [
            SELECT Id, Name,
                (SELECT Id, Name, Email, Phone FROM Contacts)
            FROM Account
            WHERE Id IN (SELECT AccountId FROM Contact WHERE AccountId != null)
            ORDER BY Name
            LIMIT 50
        ];
        
        // Transform the data
        for (Account acc : accounts) {
            AccountWithContacts accWithContacts = new AccountWithContacts();
            accWithContacts.accountId = acc.Id;
            accWithContacts.accountName = acc.Name;
            
            for (Contact con : acc.Contacts) {
                ContactInfo contactInfo = new ContactInfo();
                contactInfo.contactId = con.Id;
                contactInfo.contactName = con.Name;
                contactInfo.email = con.Email;
                contactInfo.phone = con.Phone;
                accWithContacts.contacts.add(contactInfo);
            }
            
            result.add(accWithContacts);
        }
        
        return result;
    }
}