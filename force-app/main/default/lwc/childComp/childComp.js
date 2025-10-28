import { LightningElement, api, track } from 'lwc';

export default class ChildComp extends LightningElement {
    @api messageFromParent;   // data from parent
    @track count = 0;         // reactive variable

    handleIncrement() {
        this.count += 1;
    }
}
