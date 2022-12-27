import pymysql

conn, curr = None, None
data1, data2, data3, data4 = "", "", "", ""
sql=""

conn = pymysql.connect(host='127.0.0.1', user='root', password='0000',
db = 'soloDB', charset='utf8')
cur = conn.cursor()

while(True):
    data1 = input("User ID ==> ")
    
    if data1 == "":
        break
    data2 = input("User name ==> ")
    data3 = input("User email ==> ")
    data4 = input("User born ==> ")
    sql = "INSERT INTO userTable VALUES('data1', 'data2', 'data3', data4)"
    cur.execute(sql)

conn.commit()
conn.close()


    