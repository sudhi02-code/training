import { LightningElement, api } from 'lwc';
import { deleteRecord } from 'lightning/uiRecordApi';

export default class DeleteRecordComponent extends LightningElement {
    @api recordId;

    deleteAccount() {
        deleteRecord(this.recordId)
            .then(() => {
                alert('Account deleted successfully');
            })
            .catch(error => {
                alert('Error deleting account: ' + error.body.message);
            });
    }
}
