import { LightningElement, wire } from 'lwc';
import getAccountDatas from '@salesforce/apex/fetchDataAccount.getAccountList';
const columns=[
    {label:'Name',fieldName:'Name' ,type:'Text'},
    {label:'Phone',fieldName:'Phone',type:'Phone'},
    {label:'Industry',fieldName:'Industry' ,type:'Text'}
];
export default class ApexWire extends LightningElement {
col=columns;
//@wire(getAccountDatas) AccountsData; 
@wire (getAccountDatas)
wiredAccounts({error,data}){
    if(data){
        this.AccountsData = data;
        console.log('Account Data',data);
    }
    if(error){
        console.error('Error in fetching Account data',error);
    }
}
}