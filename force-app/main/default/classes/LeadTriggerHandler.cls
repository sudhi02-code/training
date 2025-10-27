public class LeadTriggerHandler {
    public static void beforeUpdate(List<Lead> leads){
        //if lead is updated change the status to Working-Contacted
        if(trigger.isbefore&&trigger.isupdate){
        for(Lead leadrecords:leads){
            leadrecords.status='Working-Contacted';
            
        }
    }
}
    public static void afterUpdate(List<lead> lead,map<id,lead> leadmap){
        list<Lead> toupdatelist = new List<lead>();
    For(Lead leadrecords:lead){
        Lead oldLead =leadmap.get(leadrecords.Id);
        if(leadrecords.Industry!=oldLead.Industry&&leadrecords.Industry=='Healthcare'){
           leadrecords.LeadSource='Purchased List';
           leadrecords.SICCode__c= '1100';
           leadrecords.Primary__c='true';
            toupdatelist.add(leadrecords);
        }
    }
    if(!toupdatelist.isEmpty()){
        update toupdatelist;
    }
}
    public static void afterInsert(List<Lead> li){
        list<task> taskstoinsert = new list<task>();
    for(Lead  leadrecords:li){
        Task t = new task();
        t.Priority='Low';
        t.OwnerId=leadrecords.OwnerId;
        t.WhoId=leadrecords.Id;
        t.Description='follow up with the customer';
        t.Status='In progress';
        t.Subject='Email';
        taskstoinsert.add(t);
        
    }
    if(!taskstoinsert.isEmpty()){
        insert taskstoinsert;
    }
    }
}