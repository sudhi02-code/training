import { LightningElement, api, wire } from 'lwc';
import { getRecord, getFieldValue } from 'lightning/uiRecordApi';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import PHONE_FIELD from '@salesforce/schema/Account.Phone';

export default class AccountDetails extends LightningElement {
    @api recordId;
    isLoading = true;

    // Wire to get account record
    @wire(getRecord, { recordId: '$recordId', fields: [NAME_FIELD, PHONE_FIELD] })
    wiredAccount({ data, error }) {
        if (data) {
            this.accountName = getFieldValue(data, NAME_FIELD);
            this.accountPhone = getFieldValue(data, PHONE_FIELD);
            this.isLoading = false;
            console.log('✅ Data fetched successfully');
        } else if (error) {
            console.error('❌ Error fetching data', error);
        }
    }

    constructor() {
        super();
        console.log('1️⃣ constructor() - Component created');
    }

    connectedCallback() {
        console.log('2️⃣ connectedCallback() - Added to DOM');
    }

    renderedCallback() {
        console.log('3️⃣ renderedCallback() - Rendered on page');
    }

    disconnectedCallback() {
        console.log('4️⃣ disconnectedCallback() - Removed from DOM');
    }

    refreshData() {
        this.isLoading = true;
        console.log('🔁 Refreshing data...');
        // Simulate reloading data (like calling @wire again)
        setTimeout(() => {
            this.isLoading = false;
            console.log('✅ Data refreshed');
        }, 1500);
    }
}
