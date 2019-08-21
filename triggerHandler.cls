trigger triggerHandler on Account (before insert, before update, before delete, after update, after insert, after delete) {

    TriggerFactory.createAndExecuteHandler(DEX_AccountHandler.class);
}

/*using another named handler class to do all the processes,This way it is better to make future code repairs.*/