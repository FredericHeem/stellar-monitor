angular.module("stellarUtils", [])
.factory("stellarUtils", function($rootScope) {
  return {
    txSuccess: function(txResult) {
      var name = txResult.result().result().switch().name;
      return name;
    },
    displayTransactionResultInfo: function(txResult) {
      var results = txResult.result().result().results();
      // TODO multiple ops per transaction
      result = results[0];
      //opName = result.value().switch()
      opReturnValue = result.value().value().switch().name;
      return opReturnValue;
    }

  };
});
