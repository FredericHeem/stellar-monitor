angular.module('horizon', [ 'ngRoute', 'horizonPostgres' ]).config([
  '$routeProvider'
  ($routeProvider) ->
    $routeProvider.when '/horizon',
      templateUrl: 'templates/layout.html'
      controller: 'HorizonController'
    return
]).controller 'HorizonController', ($scope, horizonData)  ->
  $scope.resourceTitle = 'Horizon'
  $scope.resourceTemplate = 'templates/horizon.html'

  $scope.$meteorAutorun ->
    $scope.ledgerheaders = horizonData.ledgerheaders.reactive()
