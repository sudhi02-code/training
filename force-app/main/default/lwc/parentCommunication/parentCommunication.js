import { LightningElement } from 'lwc';
export default class ParentCommunication extends LightningElement {
    vol = -10;
    cname='click here';
    Empname;
    Empage;
    Empdep;
handleIncrease(){
    this.cname =event.detail.cname;
    this.vol +=1;   
}
handleDecrease(){
    this.cname =event.detail.cname;
    if(this.vol>0){
    this.vol -=1;   
    }
}
handleSubmit(event){
    this.Empname=event.detail.ename;
    this.Empage=event.detail.eage;
    this.Empdep=event.detail.edep;    
}
}