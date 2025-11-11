import { LightningElement, wire } from 'lwc';
import getAccountDatas from '@salesforce/apex/fetchDataAccount.getAccountList';
import { deleteRecord } from 'lightning/uiRecordApi'; 
import { updateRecord } from 'lightning/uiRecordApi';
import Id_FIELD from '@salesforce/schema/Account.Id';   
import Name_FIELD from '@salesforce/schema/Account.Name';
import Phone_FIELD from '@salesforce/schema/Account.Phone';
import Industry_FIELD from '@salesforce/schema/Account.Industry';

const columns = [
    { label: 'Name', fieldName: 'Name', type: 'Text', editable: true },
    { label: 'Phone', fieldName: 'Phone', type: 'Phone', editable: true },
    { label: 'Industry', fieldName: 'Industry', type: 'Text', editable: true }
];

export default class ApexWire extends LightningElement {
    col = columns;
    draftValues = [];
    selectedRecord;
    AccountsData = []; // ✅ must initialize

    @wire(getAccountDatas)
    wiredAccounts({ error, data }) {
        if (data) {
            this.AccountsData = data;
            console.log('Account Data:', data);
        }
        if (error) {
            console.error('Error fetching Account data:', error);
        }
    }

    handlesave(event) {
        const fields = {};
        fields[Id_FIELD.fieldApiName] = event.detail.draftValues[0].Id;
        fields[Name_FIELD.fieldApiName] = event.detail.draftValues[0].Name;
        fields[Phone_FIELD.fieldApiName] = event.detail.draftValues[0].Phone;
        fields[Industry_FIELD.fieldApiName] = event.detail.draftValues[0].Industry;

        updateRecord({ fields })
            .then(() => {
                alert('Record Updated Successfully');
            })
            .catch(error => {
                console.error('Error updating record:', error);
            });
    }

    handleRowSelection(event) {
        if (event.detail.selectedRows.length > 0) {
            this.selectedRecord = event.detail.selectedRows[0].Id;
            console.log('Selected Record ID:', this.selectedRecord);
        } else {
            this.selectedRecord = null;
        }
    }

    handleDelete() {
        if (!this.selectedRecord) {
            alert('Please select a record to delete');
            return;
        }

        console.log('Deleting record:', this.selectedRecord);

        deleteRecord(this.selectedRecord)
            .then(() => {
                alert('Record Deleted Successfully');

                // ✅ Remove deleted record from UI (without refresh)
                this.AccountsData = this.AccountsData.filter(
                    record => record.Id !== this.selectedRecord
                );

                this.selectedRecord = null; // clear selection
            })
            .catch(error => {
                console.error('Error deleting record:', error);
            });
    }
}
