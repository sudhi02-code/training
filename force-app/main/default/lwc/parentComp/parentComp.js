import { LightningElement } from 'lwc';

export default class ParentComp extends LightningElement {
    parentMessage = 'Hello from Parent!';

    handleChangeMessage() {
        this.parentMessage = 'Parent Message Updated!';
    }
}
