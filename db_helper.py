from setup import db
from sqlalchemy import text

def reset_db():
  sql = text("DELETE FROM messages")
  db.session.execute(sql)
  db.session.commit()