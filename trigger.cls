trigger triggerTest on Account (before delete, before insert, before update, after delete, after insert, after update) {  
    //after 'on' is the object that the trigger relates
        // after or before tells at which point in the code the trigger will be used, 'delete', 'insert', 'complete' informing if it will be before starting or after                                     
    
    /*
    for (Account a : Trigger.new) {} // Iterate over each sObject
        // This single query finds every contact that is associated with any of the
            // triggering accounts. Note that although Trigger.new is a collection of  
                // records, when used as a bind variable in a SOQL query, Apex automatically
                    // transforms the list of records into a list of corresponding Ids.
    Contact[] cons = [SELECT LastName FROM Contact WHERE AccountId IN :Trigger.new];
    */

    //This trigger uses Boolean context variables like Trigger.isBefore and Trigger.isDelete to define code that only executes for specific trigger conditions:

    //Before start code
    if (Trigger.isBefore) {

        if (Trigger.isInsert) {
            for (Account a : Trigger.new) {
                
                List<Contact> contacts = new List<Contact>();
                    for (Account a : Trigger.new) {        
                        if(a.Name == 'makeContact') {
                            contacts.add(new Contact (LastName = a.Name, AccountId = a.Id));
                        }
                    } 
                insert contacts;
                }   
            }
        }else {
            addError('Enter else ^-^ ');
        }

        if (Trigger.isDelete) {
            // In a before delete trigger, the trigger accesses the records that will be
            // deleted with the Trigger.old list.
            for (Account a : Trigger.old) {
                if (a.name != 'okToDelete') {
                    a.addError('You can\'t delete this record!');
                } 
            }
        }else{
            addError('Enter else ^-^ ');
        }
    }

    //After start code

    if (Trigger.isAfter) {

        if (Trigger.isUpdate) {

            List<Contact> contacts = new List<Contact>();
                    for (Account a : Trigger.new) {        
                        if(a.Name == 'makeContact') {
                            contacts.add(new Contact (LastName = a.Name, AccountId = a.Id));
                        }
                    } 
            insert contacts;
            }   
        }
    }
}