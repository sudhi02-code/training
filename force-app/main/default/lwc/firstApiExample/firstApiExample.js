import { LightningElement ,api} from 'lwc';

export default class FirstApiExample extends LightningElement {
 message ='First Lwc Component';
  @api recordId;
}