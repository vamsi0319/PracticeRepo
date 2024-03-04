({
    getAccountlist : function(component) {
        debugger;
        var action = component.get("c.getopplist");
        var self = this;
        action.setCallback(this, function(actionResult) {
            component.set('v.opportunities', actionResult.getReturnValue());
         });
          $A.enqueueAction(action);
    }
})