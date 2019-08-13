public with sharing class objectNameHandler {

    // here will house all trigger logic for a given object.
         // will be called by the other class 'triggerFactory in this case'.

    public void beforeInsert(SObject so){}

    public void beforeUpdate(SObject oldSo, SObject so){}

     public void beforeDelete(SObject so){}

     public void afterInsert(SObject so){}

     public void afterUpdate(SObject oldSo, SObject so){}
        
     public void afterDelete(SObject so){}

}