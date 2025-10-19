trigger AccountTrigger on Account (after update) {
    /*List<Account> updateList = new List<Account>();
    for(Account acc : Trigger.new){
        if(acc.Industry == 'IT'){
            acc.Industry = 'Banking';
            updateList.add(acc); // Add to list for update
        }
    }
    if(!updateList.isEmpty()){
        update updateList; // ✅ Changes are saved to DB
    }*/
     /*for(Account acc :Trigger.New){
        if(acc.Ownership=='Private'){
            acc.addError('you cannot save the account');
        }
    }*/
// if account website is updated automatically update the contact website
   /* list<Contact> listtoupdate = new list<contact>();
    set<id> se = new set<id>();
    for(Account a:Trigger.new){
        if(a.Website!=trigger.oldmap.get(a.id).website){
            se.add(a.id);
        }
    }
    map<id,Account> mapvalues = new map<id,Account>([select id,website from Account where id in:se]);
    list<Contact> li = [select Id ,AccountWebsite__c ,AccountId from contact where AccountId in :se];
    for(Contact c: li){
        if(mapvalues.containskey(c.AccountId)){
        c.AccountWebsite__c= mapvalues.get(c.AccountId).website;
        listtoupdate.add(c);
    }
    }
    if(!listtoupdate.isEmpty()){
        update listtoupdate;
    }*/
    // when account descrition is updated automatically update the contact description
        list<contact> toupdate = new list<contact>();
    set<id> setaccount = new set<id>();
    for(Account acc:Trigger.new){
        if(acc.description!=trigger.oldmap.get(acc.id).description){
            setaccount.add(acc.id);
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