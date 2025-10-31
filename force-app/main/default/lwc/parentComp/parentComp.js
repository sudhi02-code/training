import { LightningElement} from 'lwc';
export default class ParentComp extends LightningElement {
  name ='Sudeeshna';
        handleSubmit(event){
            alert('this is lwc component');
            //this.name='sudeeshna Sutharapu';
        }
        handleChange(event){
            this.name=event.target.value;
        }
        firstnumber;
        secondnumber;
        thirdnumber;
        handlefirst(event){
            this.firstnumber=event.target.value;
        }
        handlesecond(event){
            this.secondnumber=event.target.value;
        }
        handlethird(event){
            this.thirdnumber=event.target.value;
        }
        handleAdd(event){
            const a = parseInt(this.firstnumber);
            const b = parseInt(this.secondnumber);
            const c = parseInt(this.thirdnumber);
           if(a>b&&a>c){
            alert('First number is largest:'+a);
           }
              else if(b>c&&b>a){        
                alert('Secound number is largest:'+b);
                }   
                else{
                    alert('Third number is largest:'+c);
                }
        }
        handleClear(event){
            this.firstnumber='';
            this.secondnumber='';
            this.thirdnumber='';  
        }

}
