from setup import db
from sqlalchemy import text

def get_messages():
    result = db.session.execute(text("SELECT content FROM messages"))
    messages = result.fetchall()
    return messages

def create_message(content):
    sql = text("INSERT INTO messages (content) VALUES (:content)")
    db.session.execute(sql, { "content": content })
    db.session.commit()

def get_one():
    result = db.session.execute(text("SELECT 1"))
    return result.fetchall()