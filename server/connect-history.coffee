HISTORY_DB_URL = process.env['HISTORY_DB_URL']

if !HISTORY_DB_URL
  return

#console.log 'Please specify Postgres connection string in CORE_DB_URL environment variable' unless CORE_DB_URL

liveDbHistory = new LivePg(HISTORY_DB_URL, 'history');

Meteor.publish 'horizonLastLedgerHeaders', ->
  liveDbHistory.select('SELECT * FROM history_ledgers ORDER BY sequence DESC limit 5')

Meteor.publish 'horizonLastTransactions', ->
  liveDbHistory.select('SELECT * FROM history_transactions ORDER BY ledger_sequence DESC limit 10')

Meteor.publish 'horizonLastOperations', ->
  liveDbHistory.select('SELECT * FROM history_operations ORDER BY id DESC limit 10')
  
# TODO order by what ?
Meteor.publish 'horizonLastEffects', ->
  liveDbHistory.select('SELECT * FROM history_effects ORDER BY history_account_id DESC limit 10')
