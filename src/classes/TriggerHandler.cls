public virtual class TriggerHandler {

  // static map of handlername, times run() was invoked
  private static Map<String, LoopCount> loopCountMap;

  // the current context of the trigger, overridable in tests
  @TestVisible
  private TriggerContext context;

  // the current context of the trigger, overridable in tests
  @TestVisible
  private Boolean isTriggerExecuting;

  // static initialization
  static {
    loopCountMap = new Map<String, LoopCount>();
  }
  
  // constructor
  public TriggerHandler() {
    this.setTriggerContext();
  }

  /***************************************
   * public instance methods
   ***************************************/

  // main method that will be called during execution
  public void run() {
    addToLoopCount();

    // dispatch to the correct handler method
    switch on this.context {
      when BEFORE_INSERT {
        beforeInsert(Trigger.new);
        beforeInsert(Trigger.newMap);
        beforeInsert(Trigger.new, Trigger.old);
        beforeInsert(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertUpdate(Trigger.new);
        beforeInsertUpdate(Trigger.newMap);
        beforeInsertUpdate(Trigger.new, Trigger.old);
        beforeInsertUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertDelete(Trigger.new);
        beforeInsertDelete(Trigger.newMap);
        beforeInsertDelete(Trigger.new, Trigger.old);
        beforeInsertDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertUpdateDelete(Trigger.new);
        beforeInsertUpdateDelete(Trigger.newMap);
        beforeInsertUpdateDelete(Trigger.new, Trigger.old);
        beforeInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when BEFORE_UPDATE {
        beforeUpdate(Trigger.new);
        beforeUpdate(Trigger.newMap);
        beforeUpdate(Trigger.new, Trigger.old);
        beforeUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertUpdate(Trigger.new);
        beforeInsertUpdate(Trigger.newMap);
        beforeInsertUpdate(Trigger.new, Trigger.old);
        beforeInsertUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeUpdateDelete(Trigger.new);
        beforeUpdateDelete(Trigger.newMap);
        beforeUpdateDelete(Trigger.new, Trigger.old);
        beforeUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertUpdateDelete(Trigger.new);
        beforeInsertUpdateDelete(Trigger.newMap);
        beforeInsertUpdateDelete(Trigger.new, Trigger.old);
        beforeInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when BEFORE_DELETE {
        beforeDelete(Trigger.new);
        beforeDelete(Trigger.newMap);
        beforeDelete(Trigger.new, Trigger.old);
        beforeDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertDelete(Trigger.new);
        beforeInsertDelete(Trigger.newMap);
        beforeInsertDelete(Trigger.new, Trigger.old);
        beforeInsertDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeUpdateDelete(Trigger.new);
        beforeUpdateDelete(Trigger.newMap);
        beforeUpdateDelete(Trigger.new, Trigger.old);
        beforeUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        beforeInsertUpdateDelete(Trigger.new);
        beforeInsertUpdateDelete(Trigger.newMap);
        beforeInsertUpdateDelete(Trigger.new, Trigger.old);
        beforeInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when AFTER_INSERT {
        afterInsert(Trigger.new);
        afterInsert(Trigger.newMap);
        afterInsert(Trigger.new, Trigger.old);
        afterInsert(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdate(Trigger.new);
        afterInsertUpdate(Trigger.newMap);
        afterInsertUpdate(Trigger.new, Trigger.old);
        afterInsertUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertDelete(Trigger.new);
        afterInsertDelete(Trigger.newMap);
        afterInsertDelete(Trigger.new, Trigger.old);
        afterInsertDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUndelete(Trigger.new);
        afterInsertUndelete(Trigger.newMap);
        afterInsertUndelete(Trigger.new, Trigger.old);
        afterInsertUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateDelete(Trigger.new);
        afterInsertUpdateDelete(Trigger.newMap);
        afterInsertUpdateDelete(Trigger.new, Trigger.old);
        afterInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertDeleteUndelete(Trigger.new);
        afterInsertDeleteUndelete(Trigger.newMap);
        afterInsertDeleteUndelete(Trigger.new, Trigger.old);
        afterInsertDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateUndelete(Trigger.new);
        afterInsertUpdateUndelete(Trigger.newMap);
        afterInsertUpdateUndelete(Trigger.new, Trigger.old);
        afterInsertUpdateUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when AFTER_UPDATE {
        afterUpdate(Trigger.new);
        afterUpdate(Trigger.newMap);
        afterUpdate(Trigger.new, Trigger.old);
        afterUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdate(Trigger.new);
        afterInsertUpdate(Trigger.newMap);
        afterInsertUpdate(Trigger.new, Trigger.old);
        afterInsertUpdate(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateDelete(Trigger.new);
        afterUpdateDelete(Trigger.newMap);
        afterUpdateDelete(Trigger.new, Trigger.old);
        afterUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateUndelete(Trigger.new);
        afterUpdateUndelete(Trigger.newMap);
        afterUpdateUndelete(Trigger.new, Trigger.old);
        afterUpdateUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateDelete(Trigger.new);
        afterInsertUpdateDelete(Trigger.newMap);
        afterInsertUpdateDelete(Trigger.new, Trigger.old);
        afterInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateUndelete(Trigger.new);
        afterInsertUpdateUndelete(Trigger.newMap);
        afterInsertUpdateUndelete(Trigger.new, Trigger.old);
        afterInsertUpdateUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateDeleteUndelete(Trigger.new);
        afterUpdateDeleteUndelete(Trigger.newMap);
        afterUpdateDeleteUndelete(Trigger.new, Trigger.old);
        afterUpdateDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when AFTER_DELETE {
        afterDelete(Trigger.new);
        afterDelete(Trigger.newMap);
        afterDelete(Trigger.new, Trigger.old);
        afterDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertDelete(Trigger.new);
        afterInsertDelete(Trigger.newMap);
        afterInsertDelete(Trigger.new, Trigger.old);
        afterInsertDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateDelete(Trigger.new);
        afterUpdateDelete(Trigger.newMap);
        afterUpdateDelete(Trigger.new, Trigger.old);
        afterUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterDeleteUndelete(Trigger.new);
        afterDeleteUndelete(Trigger.newMap);
        afterDeleteUndelete(Trigger.new, Trigger.old);
        afterDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateDelete(Trigger.new);
        afterInsertUpdateDelete(Trigger.newMap);
        afterInsertUpdateDelete(Trigger.new, Trigger.old);
        afterInsertUpdateDelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertDeleteUndelete(Trigger.new);
        afterInsertDeleteUndelete(Trigger.newMap);
        afterInsertDeleteUndelete(Trigger.new, Trigger.old);
        afterInsertDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateDeleteUndelete(Trigger.new);
        afterUpdateDeleteUndelete(Trigger.newMap);
        afterUpdateDeleteUndelete(Trigger.new, Trigger.old);
        afterUpdateDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
      when AFTER_UNDELETE {
        afterUndelete(Trigger.new);
        afterUndelete(Trigger.newMap);
        afterUndelete(Trigger.new, Trigger.old);
        afterUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUndelete(Trigger.new);
        afterInsertUndelete(Trigger.newMap);
        afterInsertUndelete(Trigger.new, Trigger.old);
        afterInsertUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateUndelete(Trigger.new);
        afterUpdateUndelete(Trigger.newMap);
        afterUpdateUndelete(Trigger.new, Trigger.old);
        afterUpdateUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterDeleteUndelete(Trigger.new);
        afterDeleteUndelete(Trigger.newMap);
        afterDeleteUndelete(Trigger.new, Trigger.old);
        afterDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertDeleteUndelete(Trigger.new);
        afterInsertDeleteUndelete(Trigger.newMap);
        afterInsertDeleteUndelete(Trigger.new, Trigger.old);
        afterInsertDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterInsertUpdateUndelete(Trigger.new);
        afterInsertUpdateUndelete(Trigger.newMap);
        afterInsertUpdateUndelete(Trigger.new, Trigger.old);
        afterInsertUpdateUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
        afterUpdateDeleteUndelete(Trigger.new);
        afterUpdateDeleteUndelete(Trigger.newMap);
        afterUpdateDeleteUndelete(Trigger.new, Trigger.old);
        afterUpdateDeleteUndelete(Map<Id, SObject> newMap, Trigger.oldMap);
      }
    }
  }

  public void setMaxLoopCount(Integer max) {
    String handlerName = getHandlerName();
    if(!TriggerHandler.loopCountMap.containsKey(handlerName)) {
      TriggerHandler.loopCountMap.put(handlerName, new LoopCount(max));
    } else {
      TriggerHandler.loopCountMap.get(handlerName).setMax(max);
    }
  }

  public void clearMaxLoopCount() {
    this.setMaxLoopCount(-1);
  }

  /***************************************
   * private instancemethods
   ***************************************/

  @TestVisible
  private void setTriggerContext() {
    this.setTriggerContext(null, false);
  }

  @TestVisible
  private void setTriggerContext(String ctx, Boolean testMode) {
    if(!Trigger.isExecuting && !testMode) {
      this.isTriggerExecuting = false;
      return;
    } else {
      this.isTriggerExecuting = true;
    }
    
    if((Trigger.isExecuting && Trigger.isBefore && Trigger.isInsert) ||
        (ctx != null && ctx == 'before insert')) {
      this.context = TriggerContext.BEFORE_INSERT;
    } else if((Trigger.isExecuting && Trigger.isBefore && Trigger.isUpdate) ||
        (ctx != null && ctx == 'before update')){
      this.context = TriggerContext.BEFORE_UPDATE;
    } else if((Trigger.isExecuting && Trigger.isBefore && Trigger.isDelete) ||
        (ctx != null && ctx == 'before delete')) {
      this.context = TriggerContext.BEFORE_DELETE;
    } else if((Trigger.isExecuting && Trigger.isAfter && Trigger.isInsert) ||
        (ctx != null && ctx == 'after insert')) {
      this.context = TriggerContext.AFTER_INSERT;
    } else if((Trigger.isExecuting && Trigger.isAfter && Trigger.isUpdate) ||
        (ctx != null && ctx == 'after update')) {
      this.context = TriggerContext.AFTER_UPDATE;
    } else if((Trigger.isExecuting && Trigger.isAfter && Trigger.isDelete) ||
        (ctx != null && ctx == 'after delete')) {
      this.context = TriggerContext.AFTER_DELETE;
    } else if((Trigger.isExecuting && Trigger.isAfter && Trigger.isUndelete) ||
        (ctx != null && ctx == 'after undelete')) {
      this.context = TriggerContext.AFTER_UNDELETE;
    }
  }

  // increment the loop count
  @TestVisible
  private void addToLoopCount() {
    String handlerName = getHandlerName();
    if(TriggerHandler.loopCountMap.containsKey(handlerName)) {
      Boolean exceeded = TriggerHandler.loopCountMap.get(handlerName).increment();
      if(exceeded) {
        Integer max = TriggerHandler.loopCountMap.get(handlerName).max;
        throw new TriggerHandlerException('Maximum loop count of ' + String.valueOf(max) + ' reached in ' + handlerName);
      }
    }
  }

  @TestVisible
  private String getHandlerName() {
    return String.valueOf(this).substring(0,String.valueOf(this).indexOf(':'));
  }

  /***************************************
   * context methods
   ***************************************/

  // context-specific methods for override
  @TestVisible protected virtual void beforeInsert(List<SObject> newList) {}
  @TestVisible protected virtual void beforeInsert(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeInsert(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeInsert(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeUpdate(List<SObject> newList) {}
  @TestVisible protected virtual void beforeUpdate(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeUpdate(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeDelete(List<SObject> newList) {}
  @TestVisible protected virtual void beforeDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsert(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsert(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsert(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsert(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterUpdate(List<SObject> newList) {}
  @TestVisible protected virtual void afterUpdate(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterUpdate(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterDelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeInsertUpdate(List<SObject> newList) {}
  @TestVisible protected virtual void beforeInsertUpdate(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeInsertUpdate(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeInsertUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeInsertDelete(List<SObject> newList) {}
  @TestVisible protected virtual void beforeInsertDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeInsertDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeInsertDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeUpdateDelete(List<SObject> newList) {}
  @TestVisible protected virtual void beforeUpdateDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeUpdateDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeUpdateDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void beforeInsertUpdateDelete(List<SObject> newList) {}
  @TestVisible protected virtual void beforeInsertUpdateDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void beforeInsertUpdateDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void beforeInsertUpdateDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertUpdate(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertUpdate(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertUpdate(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertUpdate(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertDelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterUpdateDelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterUpdateDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterUpdateDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterUpdateDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterUpdateUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterUpdateUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterUpdateUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterUpdateUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterDeleteUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterDeleteUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterDeleteUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterDeleteUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertUpdateDelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertUpdateDelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertUpdateDelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertUpdateDelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertDeleteUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertDeleteUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertDeleteUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertDeleteUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterInsertUpdateUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterInsertUpdateUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterInsertUpdateUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterInsertUpdateUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}
  @TestVisible protected virtual void afterUpdateDeleteUndelete(List<SObject> newList) {}
  @TestVisible protected virtual void afterUpdateDeleteUndelete(Map<Id, SObject>newMap) {}
  @TestVisible protected virtual void afterUpdateDeleteUndelete(List<SObject> newList, List<SObject> oldList) {}
  @TestVisible protected virtual void afterUpdateDeleteUndelete(Map<Id, SObject> newMap, Map<Id, SObject> oldMap) {}

  /***************************************
   * inner classes
   ***************************************/

  // inner class for managing the loop count per handler
  @TestVisible
  private class LoopCount {
    private Integer max;
    private Integer count;

    public LoopCount() {
      this.max = 5;
      this.count = 0;
    }

    public LoopCount(Integer max) {
      this.max = max;
      this.count = 0;
    }

    public Boolean increment() {
      this.count++;
      return this.exceeded();
    }

    public Boolean exceeded() {
      if(this.max < 0) return false;
      if(this.count > this.max) {
        return true;
      }
      return false;
    }

    public Integer getMax() {
      return this.max;
    }

    public Integer getCount() {
      return this.count;
    }

    public void setMax(Integer max) {
      this.max = max;
    }
  }

  // possible trigger contexts
  @TestVisible
  private enum TriggerContext {
    BEFORE_INSERT, BEFORE_UPDATE, BEFORE_DELETE,
    AFTER_INSERT, AFTER_UPDATE, AFTER_DELETE,
    AFTER_UNDELETE
  }

  // exception class
  public class TriggerHandlerException extends Exception {}

}
