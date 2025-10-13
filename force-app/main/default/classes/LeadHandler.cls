public with sharing class LeadHandler {
    public LeadHandler() {
     for(Lead leadrecords:Trigger.new){
            if(leadrecords.Status !=Trigger.OldMap.get(leadrecords.Id).Status)
            {
                leadrecords.Status ='Working-Contacted';
            }
        }
    }
}