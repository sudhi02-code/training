import { LightningElement } from 'lwc';

export default class Detailsform extends LightningElement {
    FirstName;
    LastName;
    Email;
    Phone;

    handlefirst(event) {
        this.FirstName = event.target.value;
    }

    handlelast(event) {
        this.LastName = event.target.value;
    }

    handleemail(event) {
        this.Email = event.target.value;
    }

    handlephone(event) {
        this.Phone = event.target.value;
    }

    handleSave() {
        console.log('First Name: ' + this.FirstName);
        console.log('Last Name: ' + this.LastName);
        console.log('Email: ' + this.Email);
        console.log('Phone: ' + this.Phone);
    }
}
