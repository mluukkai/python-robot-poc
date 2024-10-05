from flask import redirect, render_template, request, jsonify

from setup import app
from service import get_messages, create_message, get_one
from db_helper import reset_db, setup_db

@app.route("/")
def index():
    messages = get_messages()
    return render_template("index.html", count=len(messages), messages=messages) 

@app.route("/new")
def new():
    return render_template("new.html")

@app.route("/send", methods=["POST"])
def send():
    create_message(request.form["content"])
    print("send")
    return redirect("/")

@app.route("/setup_db")
def setup_database():
    setup_db()
    print("setup db")
    return jsonify({ 'message': "ok" })

@app.route("/reset_db")
def reset_database():
    reset_db()
    print("reset db")
    return jsonify({ 'message': "ok" })

@app.route("/ping")
def ping():
    return jsonify({ 'message': "pong" })

@app.route("/one")
def one():
    data = get_one()
    print(data[0][0])
    return f"result {data[0][0]}"