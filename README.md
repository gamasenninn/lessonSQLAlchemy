# lessonSQLAlchemy

FLASKによるAPIを作るためのレッスン
SQLAでどのように作るかざっくり説明
まず顧客の住所録をつくってみる


pip install flask-alchemy


## データベースを用意

## 全件表示のプログラム

まずは全件表示。
モデルを定義してさえいれば

Clients.query.all()　で読みだせます。

```python

from flask import Flask, request, render_template, redirect
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///clients.db"
db = SQLAlchemy(app)

class Clients(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    client_name = db.Column(db.String(100))
    tel = db.Column(db.String(30))
    address = db.Column(db.String(255))
    
#----全件表示----
records = Clients.query.all()

for rec in records:
    print(rec.id,rec.client_name,rec.tel,rec.address)

```
