run_statement <- function(s) {
  conn = dbConnect(SQLite(),'chinook.db')
  dbExecute(conn, s)
  dbDisconnect(conn)
}

run_query <- function(q) {
  conn = dbConnect(SQLite(),'chinook.db')
  result <- dbGetQuery(conn, q)
  dbDisconnect(conn)
  return(result)
}

show_tables <- function() {
  run_query('SELECT
    name,
    type
FROM sqlite_master
WHERE type IN ("table","view");')
}
