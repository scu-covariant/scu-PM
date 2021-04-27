import csdbc_mysql
import hackerspace

hackerspace.csdbc_adpter = csdbc_mysql.connect("./db_config.json")
hackerspace.start()