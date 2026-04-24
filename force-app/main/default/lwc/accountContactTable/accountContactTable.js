import { LightningElement, wire } from 'lwc';
import getAccountsWithContacts from '@salesforce/apex/AccountContactController.getAccountsWithContacts';

export default class AccountContactTable extends LightningElement {
    accountsWithContacts = [];
    error;
    isLoading = true;

    @wire(getAccountsWithContacts)
    wiredAccounts({ error, data }) {
        this.isLoading = true;
        if (data) {
            this.accountsWithContacts = data;
            this.error = undefined;
            this.isLoading = false;
        } else if (error) {
            this.error = error.body ? error.body.message : 'Unknown error occurred';
            this.accountsWithContacts = [];
            this.isLoading = false;
        }
    }

    get hasData() {
        return !this.isLoading && !this.error && this.accountsWithContacts && this.accountsWithContacts.length > 0;
    }

    get noData() {
        return !this.isLoading && !this.error && (!this.accountsWithContacts || this.accountsWithContacts.length === 0);
    }
}