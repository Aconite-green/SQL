# MySql & Python
## **Input data**
1. **MySql 연결하기** 
> 연결자 = pymysql.connect(connect_option)

<br>

2. **커서 생성하기**
> 커서 이름 = 연결자.cursor()

<br>

3. **데이블 만들기**
> 커서 이름.execute("CREATE TABLE ~")

<br>

4. **데이터 입력하기**
> 커서 이름.execute("INSERT ~")

<br>

5. **입력한 데이터 저장하기**
> 연결자.commit()

<br>

6. **MySql 연결 종료하기**
> 연결자.close() 