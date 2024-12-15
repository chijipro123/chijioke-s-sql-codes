import taskmanager
from flask import Flask, render_template, request, redirect, url_for
from flask_mysqldb import MySQL
#initialize Flask app
app=Flask(__name__)
# Connection to database
app.config['MYSQL_HOST']='localhost'
app.config['MYSQL_USER']='root'
app.config['MYSQL_PASSWORD']='chiji123'
app.config['MYSQL_DB']='taskmanager_Db'
# initialize MySQL Connection
mysql=MySQL(app)
@app.route('/')
def index():
    cur=mysql.connection.cursor()
    cur.execute("SELECT * FROM Task")
    data=cur.fetchall()
    return render_template('index.html', Task=data)

# Inserting data
@app.route('/insert', methods=['POST'])
def insert():
    title=request.form['']
    desc=request.form['description']
    cur=mysql.connection.cursor()
    cur.execute('INSERT INTO Task (Days_deadline, Description,proirity_level) VALUES (%s, %s,%s)',(Days_deadline, desc,proirity_level))
    mysql.connection.commit()
    return redirect(url_for('index'))


if __name__=="__main__":
    app.run(debug=True)

 
