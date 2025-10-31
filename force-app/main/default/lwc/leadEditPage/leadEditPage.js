import { LightningElement,api } from 'lwc';

export default class LeadEditPage extends LightningElement {
@api recordId;
    handlesave(event){
         const inputfields=this.template.querySelectorAll('lightning-input-field');
         inputfields.forEach(field=>{ field.reset();});
    }
}