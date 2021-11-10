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

``` python

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

更新・追加までのテストプログラム
``` python
from flask import Flask, request, render_template, redirect,jsonify
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_DATABASE_URI'] = "sqlite:///client.db"
db = SQLAlchemy(app)
import json

class Client(db.Model):
    __tablename__ = 'client'
    
    id = db.Column(db.Integer, primary_key=True)
    client_name = db.Column(db.String(100))
    tel = db.Column(db.String(30))
    address = db.Column(db.String(255))

    def to_dict(self):
        return {
            'id': self.id,
            'client_name': self.client_name,
            'tel': self.tel,
            'address': self.address,
        }
#----全件表示----
clients = Client.query.all()

for client in clients:
    print(client.id,client.client_name,client.tel,client.address)

#----id=4のレコードを取得----

client = Client.query.filter(Client.id==4).first()

print("\n----id=4のデータ---\n")
print(client.id,client.client_name,client.tel,client.address)

#----id=4のレコードの電話番号を更新して表示----

client.tel = "999-999-9999"
client = Client.query.filter(Client.id==4).first()

print("\n----id=4のデータ---\n")
print(client.id,client.client_name,client.tel,client.address)

#----新規のデータを作成する----
newClient = Client(client_name="新規",tel='888-888-8888')
db.session.add(newClient)

clients = Client.query.all()
print("\n----新規のデータ---\n")
for client in clients:
    print(client.id,client.client_name,client.tel,client.address)
    
#----Jsonデータを作成する----
clients = Client.query.all()

print("\n----Jsonデータ---\n")
#print ([client.to_dict() for client in clients ])
for client in clients:
    print(client.to_dict())


```

