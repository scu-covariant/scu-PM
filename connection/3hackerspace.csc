import csdbc_mysql
import db

db.csdbc_adpter = csdbc_mysql.connect("./db_config.json")
db.start()