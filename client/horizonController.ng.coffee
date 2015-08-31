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
  $scope.stellarUtils = stellarUtils
  $scope.$meteorAutorun ->
    $scope.ledgerheaders = horizonData.ledgerheaders.reactive()

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
