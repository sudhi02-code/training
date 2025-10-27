public class ContactHandlerTrigger {
    public static void beforeInsert(List<Contact> c){
        for(Contact con:c){
        if(con.AccountId==null){
            con.addError('you can not create contact');
        }
    }
}
}