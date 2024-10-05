from setup import db
from sqlalchemy import text

table_name = "messages"

def table_exists(name):
  sql_table_existence = text(
    "SELECT EXISTS ("
    "  SELECT 1"
    "  FROM information_schema.tables"
    f" WHERE table_name = '{name}'"
    ")"
  )

  result = db.session.execute(sql_table_existence)
  return result.fetchall()[0][0]

def reset_db():
  print(f"Clearing contents from table {table_name}")
  sql = text(f"DELETE FROM {table_name}")
  db.session.execute(sql)
  db.session.commit()

def setup_db():
  if table_exists(table_name):
    print(f"Table {table_name} exists, dropping")
    sql = text(f"DROP TABLE {table_name}")
    db.session.execute(sql)
    db.session.commit()

  print(f"Creating table {table_name}")
  sql = text(
    f"CREATE TABLE {table_name} ("
    "  id SERIAL PRIMARY KEY, "
    "  content TEXT NOT NULL"
    ")"
  )

  db.session.execute(sql)
  db.session.commit()