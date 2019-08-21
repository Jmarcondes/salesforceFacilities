public with sharing class TriggerFactory{
    //Will call the right method in the class that holds all the logic that would be in the trigger
    

     private static ITrigger getHandler(Type classType){
        // Instantiate the type        
        
        Object objectClass = classType.newInstance();
 
        return (ITrigger)objectClass;
    }

    public static void createAndExecuteHandler(Type classType) {
        // Get a handler appropriate to the class being processed
        Type handler = getHandler(classType);
        
        if (handler == null) {
            throw new TriggerException('No Trigger Handler registered for Class Type: ' + classType.getName());
        }
        
        // Execute the handler to fulfil the trigger
        execute(handler);
    }



    private static void execute(handler) {
        System.debug('Value of trigger new: ' + Trigger.new);
        
        // Before Trigger
        if (Trigger.isBefore){
        
            
            // Iterate through the records to be inserted passing them to the handler.
            if (Trigger.isInsert){
                for (SObject so : Trigger.new){
                    handler.beforeInsert(so);
                }
            } 
            // Iterate through the records to be updated passing them to the handler.
            else if (Trigger.isUpdate){
                for (SObject so : Trigger.old){
                    handler.beforeUpdate(so, Trigger.newMap.get(so.Id));
                }
            }
            // Iterate through the records to be deleted passing them to the handler.
            else if (Trigger.isDelete){
                for (SObject so : Trigger.old){
                    handler.beforeDelete(so);
                }
            }
        }
        // After Trigger
        else
        {
            // Iterate through the records inserted passing them to the handler.
            else if (Trigger.isInsert)
            {
                for (SObject so : Trigger.new)
                {
                    handler.afterInsert(so);
                }
            }
            // Iterate through the records updated passing them to the handler.
            else if (Trigger.isUpdate)
            {
                System.debug('Value of Trigger.old: '+Trigger.old);
                for (SObject so : Trigger.old)
                {
                    System.debug('Value of so: '+so);
                    handler.afterUpdate(so, Trigger.newMap.get(so.Id));
                }
            }
            // Iterate through the records deleted passing them to the handler.
            else if (Trigger.isDelete)
            {
                for (SObject so : Trigger.old)
                {
                    handler.afterDelete(so);
                }
            }
        }
    } 

}