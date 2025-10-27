public class OpportunityHandlerTrigger {
    public static void afterInsert(List<Opportunity> opp){
        List<Task> toinsert= new List<Task>();
    for(Opportunity oppourtityrecords:opp){
        if(oppourtityrecords.StageName=='Closed Won'){
            Task t = new Task();
            t.Priority='High';
            t.OwnerId=oppourtityrecords.OwnerId;
            t.Description='split the revenue among the team with high priority';
            t.WhatId=oppourtityrecords.Id;
            t.Status='In Progress';
                t.Subject='call';
            toinsert.add(t);
        }
    }
    if(!toinsert.isEmpty()){
        insert toinsert;
    }
    }
    public static void afterStageModified(List<Opportunity> op,Map<ID,Opportunity> mapvalues){
        list<Opportunity> stagedrecords = new list<opportunity>();
    for(Opportunity opprecords:op){
        if(opprecords.StageName!=mapvalues.get(opprecords.id).StageName&& opprecords.ExpectedRevenue!=null && opprecords.Probability!=null){
            Opportunity opp = new opportunity();
            opp.Id=opprecords.Id;
            opp.Amount=opprecords.ExpectedRevenue*opprecords.Probability;
            stagedrecords.add(opp);
        }
}
    if(!stagedrecords.isEmpty()){
         update stagedrecords;
    }
    }
    
    public static void UpdateDescription(List<Opportunity> oppp){
        for(Opportunity o: oppp){
            if(o.Amount>100000&&o.Amount<500000){
                o.Description ='update amount';
            }
        }
    }
    
}