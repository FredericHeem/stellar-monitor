angular.module('horizon', [ 'ngRoute', 'stellarPostgres' ]).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when '/horizon',
      templateUrl: 'templates/layout.html'
      controller: 'HorizonController'
    return
]).controller 'HorizonController', ($scope, stellarData)  ->
  $scope.resourceTitle = 'Horizon'
  $scope.resourceTemplate = 'templates/horizon.html'

  $scope.$meteorAutorun ->
    $scope.historyLedgerheaders = stellarData.historyLedgerheaders.reactive()
