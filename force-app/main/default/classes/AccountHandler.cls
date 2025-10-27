public class AccountHandler {
    public static void beforeInsert(List<Account> ac){
        for(Account a:ac){
            if(a.Industry==null){
                System.debug('should not be null');
            }
        }
    }
    public static void afterUpdate(List<Account> acc,Map<ID,Account> accountmap){
         list<contact> toupdate = new list<contact>();
    set<id> setaccount = new set<id>();
    for(Account a:acc){
        if(a.Description!=accountmap.get(a.id).Description){
            setaccount.add(a.id);
        }
    }
    map<id,account> mapvalues = new map<id,account>([select id,description from account where id in:setaccount]);
    list<contact> contactlist =[select id ,description,accountid from contact where accountid!=null];
    for(Contact con:contactlist){
        if(mapvalues.containskey(con.accountid)){
            con.description= mapvalues.get(con.accountid).description;
            toupdate.add(con);
        }
    }
    if(!toupdate.isEmpty()){
        update toupdate;
    }
    
    }
    
}