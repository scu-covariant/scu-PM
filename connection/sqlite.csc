import csdbc_sqlite
import db

db.csdbc_adpter = csdbc_sqlite.open("./PM.db")
db.start()