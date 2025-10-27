public class TaskTriggerHandler {
    public static void afterInsert(List<Task> ts){
        //After a task is created set the priority to high
        if(trigger.isinsert){
    for(Task T:ts){
        if(T.Priority!='High'&&T.Priority==null ||T.Priority==''){
            T.Priority='High';
    }
}
        }
    }
}