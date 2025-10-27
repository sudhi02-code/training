public class CaseHandlerTrigger {
    public static void afterInsert(List<case> cases){
        //if case origin is phone set priority to high else lowss
        for(Case caserecords:cases){
        if(caserecords.Origin=='Phone'){
            caserecords.Priority='High';
        }
        else{
            caserecords.Priority='Low';
        }
    }
}
}