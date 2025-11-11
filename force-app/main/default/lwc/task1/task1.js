import { LightningElement, track } from 'lwc';

export default class UserForm extends LightningElement {
    @track firstName = '';
    @track lastName = '';
    @track email = '';
    @track phone = '';

    handleChange(event) {
        const field = event.target.name;
        this[field] = event.target.value;
    }

    handleSubmit() {
        console.log('===== Form Details =====');
        console.log('First Name:', this.firstName);
        console.log('Last Name:', this.lastName);
        console.log('Email:', this.email);
        console.log('Phone:', this.phone);
        alert('Form submitted! Check console for details.');
    }
}
