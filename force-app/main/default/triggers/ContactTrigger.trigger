trigger ContactTrigger on Contact (after insert) {
    /*for(Contact con:Trigger.New){
        if(con.AccountId==null){
            con.addError('you can not create contact');
        }
    }*/
// do not allow contact creation if a contact already exists with the name,email,phone
 /*map<id,contact>  mapvales =new map<id,contact>([select id,lastname,email,phone from contact]);
    for(Contact c:trigger.new){
        if(c.Lastname!=null&&c.Email!=null&&c.Phone!=null){
        if(c.LastName==mapvales.get(c.id).lastname||c.Email==mapvales.get(c.id).email||c.Phone==mapvales.get(c.id).phone){
            c.addError('contact already exist');
        }
        }
    }*/
    //when ever a contact is created share it to the contact releated publc group
    /*list<contactshare> li = new list<contactshare>();
    Id shareid =[select id,name from group where name='Contactgroup' limit 1].id;
    for(Contact c: trigger.new){
        ContactShare cons = new ContactShare();
        cons.ContactAccessLevel='edit';
        cons.ContactId=c.id;
        cons.RowCause='Manual';
        cons.UserOrGroupId= shareid;
        li.add(cons);
    }
    if(!li.isEmpty()){
        insert li;
    }*/
    // when a contact is created create releated case and populate the contactid,accountid
    /*list<case> casetoupdate = new list<case>();
    for(contact con:Trigger.new){
        if(con.AccountId!=null){
        case c = new case();
      c.AccountId=con.AccountId;
        c.ContactId=con.Id;
            c.Status='new';
            c.Origin='phone';
            casetoupdate.add(c);
    } 
}
    if(!casetoupdate.isEmpty()){
        insert casetoupdate;
    }*/
    set<Id> accountset= new set<id>();
    for(contact con:Trigger.new){
        if(con.AccountId!=null){
        accountset.add(con.AccountId);
    }
    }
        map<id,Account> mapvalues = new map<Id,Account>([select id,Billingstreet,Billingcity,Billingstate ,BillingPostalcode,BillingCountry
                                                        from account where id in:accountset]);
        list<Contact> contactstoupdate = new List<Contact>();
    for(Contact c:trigger.new){
        if(mapvalues.keyset().contains(c.AccountId)){
            c.MailingStreet= mapvalues.get(c.AccountId).BillingStreet;
            c.MailingCity=mapvalues.get(c.AccountId).BillingCity;
            c.Mailingstate=mapvalues.get(c.AccountId).BillingState;
            c.MailingPostalCode=mapvalues.get(c.AccountId).BillingPostalcode;
            contactstoupdate.add(c);
            
        }
    }
    if(!contactstoupdate.isEmpty()){
        update contactstoupdate;
    }

}