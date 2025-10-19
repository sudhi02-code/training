public class Encapsulation {
private Decimal Balance=0;
    public void amount(Decimal value){
        if(value<=0){
            Throw new IllegalArgumentException('Amount must be positive');
        }
        Balance+=value;
    }
    public decimal getBalance(){
        return Balance;
    }
}

//Encapsulation en = new Encapsulation();
 //en.amount(10000);
//System.debug(en.getBalance());