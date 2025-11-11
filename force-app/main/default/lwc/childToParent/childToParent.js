import { LightningElement } from 'lwc';

export default class ChildToParent extends LightningElement {
handleIncrease(){
    const increaseEvent = new CustomEvent('increase',{
        detail:'volume up'});
    this.dispatchEvent(increaseEvent);
}
handleDecrease(){
    const decreaseEvent = new CustomEvent('decrease',{
        detail:'volume down'});
    this.dispatchEvent(decreaseEvent);

}

Empname(event){
    this.ename=event.target.value;  
}
Empage(event){
    this.eage=event.target.value;  
}
Empdept(event){
    this.edep=event.target.value;  
}
handleSubmit(){
    const submitEvent = new CustomEvent('submit',{
        detail:{ename:this.ename,eage:this.eage,edept:this.edep}});
    this.dispatchEvent(submitEvent);
}

}