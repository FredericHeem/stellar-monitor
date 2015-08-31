angular.module('horizon', [ 'ngRoute', 'horizonPostgres', 'stellarUtils' ]).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when '/horizon',
      templateUrl: 'templates/layout.html'
      controller: 'HorizonController'
    return
]).controller 'HorizonController', ($scope, horizonData, stellarUtils)  ->
  $scope.resourceTitle = 'Horizon'
  $scope.resourceTemplate = 'templates/horizon.html'

  $scope.$meteorAutorun ->
    $scope.ledgerheaders = horizonData.ledgerheaders.reactive()

  $scope.$meteorAutorun ->
    pgOperations = horizonData.operations.reactive()
    $scope.operations = for pgOperation in pgOperations
      {
        pg: pgOperation
      }

  $scope.$meteorAutorun ->
    pgTransactions = horizonData.transactions.reactive()
    $scope.pgTransactions = pgTransactions
    $scope.transactions = for pgTransaction in pgTransactions
      {
        pg: pgTransaction
        #body:new StellarBase.Transaction(pgTransaction.txbody)
        success: stellarUtils.txSuccess(StellarBase.Transaction.decodeTransactionResultPair(pgTransaction.txresult))
        resultInfo: stellarUtils.displayTransactionResultInfo(StellarBase.Transaction.decodeTransactionResultPair(pgTransaction.txresult))
      }
