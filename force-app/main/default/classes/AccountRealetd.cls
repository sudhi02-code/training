public class AccountRealetd {
    public void Createaccount(){
        Account ac= new Account();
        ac.Name='using apex';
        ac.Phone='7842244091';
        insert ac;
    }
    public void CreateBulk(){
        List<Account> acc = new List<Account>();
        for(integer i =1;i<=200;i++){
            Account ace = new Account();
        ace.Name= 'Account '+ i;
            acc.add(ace);
    }
        insert acc;
    }
}