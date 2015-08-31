data =
  ledgerheaders: new PgSubscription 'horizonLastLedgerHeaders'
  transactions: new PgSubscription 'horizonLastTransactions'

angular.module 'horizonPostgres', []
.factory 'horizonData', -> data
