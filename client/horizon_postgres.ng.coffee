data =
  ledgerheaders: new PgSubscription 'horizonLastLedgerHeaders'
  transactions: new PgSubscription 'horizonLastTransactions'
  operations: new PgSubscription 'horizonLastOperations'

angular.module 'horizonPostgres', []
.factory 'horizonData', -> data
