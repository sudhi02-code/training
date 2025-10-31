import { LightningElement } from 'lwc';
import { createRecord } from 'lightning/uiRecordApi';
import ACCOUNT_OBJECT from '@salesforce/schema/Account';
import Name_FIELD from '@salesforce/schema/Account.Name';
import Phone_FIELD from '@salesforce/schema/Account.Phone';
import Website_FIELD from '@salesforce/schema/Account.Website';


export default class CreateRecordAccount extends LightningElement {
    name;
    phone;
    website;
    handleAccountNameChange(event){
        this.name=event.target.value;
    }
    handlePhoneChange(event){
        this.phone=event.target.value;
    }
    handleWebsiteChange(event){
        this.website=event.target.value;
    }
    createAccount(event){
   const  Accountfields={
        Name:this.name,         
        Phone:this.phone,
        Website:this.website
   };
   const recordInput={apiName:'Account',fields:Accountfields};
   createRecord(recordInput).then(account=>{
    alert('Account created with Id:'+account.id);
   }).catch(error=>{
    alert('Error in account creation:'+JSON.stringify(error));
   }
   )
}
}