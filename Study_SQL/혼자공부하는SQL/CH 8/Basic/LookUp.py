import pymysql

conn, curr = None, None
data1, data2, data3, data4 = "", "", "", ""
row = None

conn = pymysql.connect(host='127.0.0.1', user='root', password='0000',
db = 'soloDB', charset='utf8')
cur = conn.cursor()

cur.execute("SELECT * FROM userTable")

print("User ID      UserName        Email       Born")
print("---------------------------------------------")

while(True):
    row = cur.fetchone()
    if row ==None:
        break
    data1 = row[0]
    data2 = row[1]
    data3 = row[2]
    data4 = row[3]
    print("%5s  %15s    %20s    %d" % (data1, data2, data3, data4))

conn.close()
