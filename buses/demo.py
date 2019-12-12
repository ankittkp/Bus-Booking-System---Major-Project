import pymysql
conn = pymysql.connect(host='localhost',user='root',password='pogo@%!!',db='busroad')
a =conn.cursor()

sql ='SELECT * from Routes;'
a.execute(sql)
countrow = a.execute(sql)
print ("Number of rows : ",countrow)
data = a.fetchone()
print(data)