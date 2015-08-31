data =
  ledgerheaders: new PgSubscription 'horizonLastLedgerHeaders'
  transactions: new PgSubscription 'horizonLastTransactions'
  operations: new PgSubscription 'horizonLastOperations'
  effects: new PgSubscription 'horizonLastEffects'
  
angular.module 'horizonPostgres', []
.factory 'horizonData', -> data
