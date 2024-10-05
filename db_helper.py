from setup import db
from sqlalchemy import text

def reset_db():
  sql = text("DELETE FROM messages")
  db.session.execute(sql)
  db.session.commit()

def setup_db():
  #try:
  #  sql = text("DROP TABLE messages")
  #  db.session.execute(sql)
  #  db.session.commit()
  #except:
  #  pass

  command = """
  CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL
  );
  """

  sql = text(command)
  db.session.execute(sql)
  db.session.commit()