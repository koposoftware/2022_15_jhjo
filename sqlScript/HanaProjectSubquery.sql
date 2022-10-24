--�̹��� ��� ���ϱ�! 
SELECT * FROM USER_SEQUENCES;

SELECT * FROM CUSTOMER_INFO;

--üũī�� �̹��� ���ϱ� 

SELECT A.IMG_URL,B.CARD_NAME 
FROM CARD_IMG A,CARD_INFO B
WHERE A.CARD_CATE_NUM=B.CARD_CATE_NUM AND B.SORT_CARD='CHECK';

--�ſ�ī�� �̹��� ���ϱ�

SELECT A.IMG_URL,B.CARD_NAME 
FROM CARD_IMG A,CARD_INFO B
WHERE A.CARD_CATE_NUM=B.CARD_CATE_NUM AND B.SORT_CARD='CREDIT';

--��Ƽī�� �̹��� ���ϱ�
SELECT A.IMG_URL,B.CARD_NAME
FROM CARD_IMG A,CARD_INFO B
WHERE A.CARD_CATE_NUM=B.CARD_CATE_NUM AND B.SORT_CARD='MULTI';

--�Һ� ī�װ��� 
SELECT A.TRAN_CATE_NUM,B.SMALL_CATE,C.ALI_TYPE 
FROM TRAN_CATE A, INDU_TYPE B, ALI_INFO C
WHERE  A.INDUSTRY_CODE = B.INDU_CODE AND A.ALI_CODE = C.ALI_CODE 
ORDER BY TRAN_CATE_NUM;

--CARD ����ȭ ���� ī�� �̸� �Է��ϸ� ���� ����. 
SELECT A.CARD_SEG_NUM,B.ALI_TYPE,B.SMALL_CATE,A.BENE_RATE,A.BENE_LIMIT,A.BENE_CODE,C.CARD_NAME
FROM CARD_BENE A,CARD_BENEFIT_VIEW B,CARD_INFO C
WHERE A.BENE_CODE = B.BENE_CODE AND C.CARD_SEG_NUM = A.CARD_SEG_NUM
ORDER BY CARD_SEG_NUM;


--Ư���ο��� ���� ī��,
SELECT B.MEMBER_NUM,A.CARD_NUM,B.NAME,CARD_CATE_NUM,D.ALI_TYPE,D.SMALL_CATE,D.BENE_CODE FROM 
CUSTOMER_CARD_INFO A,CUSTOMER_INFO B, CARD_BENE C, CARD_BENEFIT_VIEW D 
WHERE A.MEMBER_NUM = B.MEMBER_NUM AND A.CARD_CATE_NUM=C.CARD_SEG_NUM AND C.BENE_CODE = D.BENE_CODE order by name;


--Ư�� ī���� ���� ������ �̹��� ���ϵ��� ��������! 
SELECT 
A.IMG_URL, B.CARD_NAME,C.BENE_RATE*100, C.ALI_TYPE,C.SMALL_CATE,B.ANNUAL_FEE,C.BENE_LIMIT,A.CARD_CATE_NUM,B.SORT_CARD,B.CARD_SEG_NUM,D.IMG_URL
FROM CARD_IMG A,CARD_INFO B,CARD_DETAIL_BENEFIT C, NETWORK_IMG D
WHERE A.CARD_CATE_NUM = B.CARD_CATE_NUM AND  B.CARD_SEG_NUM = C.CARD_SEG_NUM AND B.ANNUAL_FEE_CODE=D.ANNUAL_FEE_CODE 


SELECT A.IMG_URL,B.CARD_NAME,B.ANNUAL_FEE,B.CARD_CATE_NUM,B.SORT_CARD,C.COMMENT_OF_CARD
FROM CARD_IMG A, CARD_INFO B,CARD_COMMENT C 
WHERE A.CARD_CATE_NUM = B.CARD_CATE_NUM AND C.CARD_CATE_NUM=A.CARD_CATE_NUM GROUP BY A.IMG_URL,B.CARD_NAME,B.ANNUAL_FEE,B.CARD_CATE_NUM,B.SORT_CARD,C.COMMENT_OF_CARD
ORDER BY B.CARD_CATE_NUM;

SELECT A.IMG_URL,B.CARD_NAME,B.ANNUAL_FEE,B.CARD_SEG_NUM,B.CARD_CATE_NUM,B.SORT_CARD
FROM CARD_IMG A, CARD_INFO B, ANNUAL_FEE C
WHERE A.CARD_CATE_NUM = B.CARD_CATE_NUM AND B.ANNUAL_FEE_CODE=C.ANNUAL_FEE_CODE;


SELECT A.IMG_URL,B.CARD_NAME,B.ANNUAL_FEE,B.CARD_SEG_NUM,B.CARD_CATE_NUM,B.SORT_CARD,C.NETWORK
FROM CARD_IMG A, CARD_INFO B, ANNUAL_FEE C
WHERE A.CARD_CATE_NUM = B.CARD_CATE_NUM AND B.ANNUAL_FEE_CODE=C.ANNUAL_FEE_CODE;


--VIEW�� ������ 
--�Һ� ī�װ������� �з��� �ǽ��� �� 

--Ư���ο��� �Һ� ���� �ε��� ��������. 
SELECT B.MEMBER_NUM,A.NAME,A.EMAIL_ADDRESS,A.GENDER,A.IDENTITY,B.CARD_NUM,B.TRAN_CATE_NUM,B.DATE_OF_USE,B.AMOUNT_OF_BUSI,C.SMALL_CATE,C.ALI_TYPE 
FROM 
CUSTOMER_INFO A,
TRAN_INFO B,
TRAN_VIEW C
WHERE A.MEMBER_NUM = B.MEMBER_NUM AND B.TRAN_CATE_NUM=C.TRAN_CATE_NUM 
ORDER BY B.MEMBER_NUM;

SELECT COUNT(*) FROM TRAN_INFO; 
--PCA�� ���� SUBQUERY 


SELECT B.MEMBER_NUM,A.EMAIL_ADDRESS,C.MIDDLE_CATE,SUM(B.AMOUNT_OF_BUSI)
FROM 
CUSTOMER_INFO A,
TRAN_INFO B,
TRAN_VIEW C
WHERE A.MEMBER_NUM = B.MEMBER_NUM AND B.TRAN_CATE_NUM = C.TRAN_CATE_NUM 
GROUP BY B.MEMBER_NUM, A.EMAIL_ADDRESS ,C.MIDDLE_CATE
ORDER BY B.MEMBER_NUM;



SELECT B.MEMBER_NUM,A.EMAIL_ADDRESS,B.TRAN_CATE_NUM,SUM(B.AMOUNT_OF_BUSI),C.ALI_TYPE,C.MIDDLE_CATE
FROM 
CUSTOMER_INFO A,
TRAN_INFO B,
TRAN_VIEW C
WHERE A.MEMBER_NUM = B.MEMBER_NUM AND B.TRAN_CATE_NUM = C.TRAN_CATE_NUM 
GROUP BY B.MEMBER_NUM, A.EMAIL_ADDRESS ,B.TRAN_CATE_NUM,C.ALI_TYPE,C.MIDDLE_CATE
ORDER BY B.MEMBER_NUM;


UPDATE TRAN_CATE SET TRAN_CATE_NUM='TC167' WHERE ALI_CODE ='M000' AND TRAN_CATE_NUM ='TC166'

--SELECT * FROM TRAN_INFO;

--VIEW�� ������ 
--�������� ���� �ڵ� �з� 


SELECT A.ALI_CODE,B.BENE_CODE,A.ALI_TYPE,C.SMALL_CATE FROM
ALI_INFO A,BENE_INFO B,INDU_TYPE C 
WHERE B.ALI_CODE =A.ALI_CODE AND B.INDUSTRY_CODE = C.INDU_CODE ORDER BY A.ALI_CODE;




--Ư���� ī�� �̹��� ��������! 
SELECT * 
FROM CARD_IMG 
WHERE CARD_CATE_NUM=(SELECT CARD_CATE_NUM
FROM CARD_INFO
WHERE CARD_SEG_NUM = 'SE00001');

--1������ ������ Ȯ���ϱ� 
SELECT * 
FROM CARD_CONSUMPTION_HISTORY
WHERE TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))
AND CARD_NUM ='3306-9894-5344-7496' ;


--2������ ������ Ȯ���ϱ� 

SELECT * 
FROM CARD_CONSUMPTION_HISTORY
WHERE TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2));

--3������ ������ Ȯ���ϱ� 

SELECT LARGE_CATE,SMALL_CATE,SUM(AMOUNT_OF_BUSI)
FROM CARD_CONSUMPTION_HISTORY
WHERE TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-3) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),0))
AND CARD_NUM ='9501-8545-3158-4829'
GROUP BY LARGE_CATE,SMALL_CATE
ORDER BY LARGE_CATE;

SELECT *
FROM CARD_CONSUMPTION_HISTORY
WHERE TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-3) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))
AND CARD_NUM ='9501-8545-3158-4829';

--Ư�� �ο��� 1����ġ ī�� ī�װ��� �Һ� ������ 
SELECT TRAN_CATE_NUM,SUM(AMOUNT_OF_BUSI) FROM CARD_CONSUMPTION_HISTORY
WHERE MEMBER_NUM =1 AND TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))
GROUP BY TRAN_CATE_NUM;

--Ư�� �ο��� 2����ġ ī�� ī�װ��� �Һ� ������
SELECT TRAN_CATE_NUM,SUM(AMOUNT_OF_BUSI) FROM CARD_CONSUMPTION_HISTORY
WHERE MEMBER_NUM =1 AND TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-2))
GROUP BY TRAN_CATE_NUM;

SELECT ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) FROM DUAL;
SELECT LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1)) FROM DUAL;


--Ư�� ����� ���� ī���� ���� ������ Ȯ���ϴ� ���� 

SELECT * FROM CUSTOMER_CARD_INFO;
SELECT BENE_RATE,BENE_LIMIT,BENE_CODE
FROM CARD_DETAIL_BENEFIT
WHERE CARD_CATE_NUM=(
SELECT CARD_CATE_NUM FROM CARD_INFO
WHERE CARD_SEG_NUM = (
SELECT CARD_CATE_NUM
FROM CUSTOMER_CARD_INFO
WHERE CARD_NUM = '3306-9894-5344-7496')); 

--Ư�� �ο��� ��ȸ�� �ڵ� ¥�� 
SELECT ANNUAL_FEE FROM CARD_INFO
WHERE CARD_SEG_NUM = (
SELECT CARD_SEG_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_NUM ='1823-6856-3323-3203'); 
SELECT * FROM CUSTOMER_CARD_INFO;

SELECT BENE_RATE,BENE_LIMIT
        FROM CARD_DETAIL_BENEFIT
        WHERE CARD_CATE_NUM=(
        SELECT CARD_CATE_NUM FROM CARD_INFO
        WHERE CARD_SEG_NUM = (
        SELECT CARD_CATE_NUM    
        FROM CUSTOMER_CARD_INFO
        WHERE CARD_NUM = '9136-9091-5563-4568' AND BENE_CODE = 'TC006'));
SELECT * FROM CARD_CONSUMPTION_HISTORY;
SELECT TRAN_CATE_NUM,AMOUNT_OF_BUSI FROM CARD_CONSUMPTION_HISTORY  WHERE CARD_NUM='9136-9091-5563-4568'; 
CURSOR CUR_ANNUAL_FEE IS 
SELECT ANNUAL_FEE FROM CARD_INFO
WHERE CARD_SEG_NUM = (
SELECT CARD_CATE_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_NUM ='9136-9091-5563-4568')


--Ư�� ī�带 �������� �� ī�� �Һ� ������ 1���� ! 

SELECT TRAN_CATE_NUM,SUM(AMOUNT_OF_BUSI)
FROM CARD_CONSUMPTION_HISTORY
WHERE CARD_NUM='3306-9894-5344-7496'
AND TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))
GROUP BY TRAN_CATE_NUM

SELECT ANNUAL_FEE
FROM CARD_INFO
WHERE CARD_SEG_NUM = (
SELECT CARD_SEG_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_NUM =P_CARD_NUM)


SELECT ANNUAL_FEE FROM CARD_INFO
WHERE CARD_SEG_NUM = (
SELECT CARD_SEG_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_NUM ='9136-9091-5563-4568'); 


-- �����ȣ�� ī�� ������ ��ȸ�ϱ� 
SELECT A.CARD_NAME,B.CARD_NUM,B.VALID_DATE,B.CVC_NUM,C.IMG_URL,A.CARD_CATE_NUM FROM 
CARD_INFO A,CUSTOMER_CARD_INFO B, CARD_IMG C
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM
AND A.CARD_CATE_NUM = C.CARD_CATE_NUM
AND A.CARD_SEG_NUM = (
SELECT CARD_SEG_NUM FROM CUSTOMER_CARD_INFO
WHERE MEMBER_NUM = 1)
AND B.MEMBER_NUM=1;

--�����ϰ� �����͸� ��ȸ����! 


SELECT TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD') AS USE_TIME,SMALL_CATE,SUM(AMOUNT_OF_BUSI) 
FROM CARD_CONSUMPTION_HISTORY
WHERE 
DATE_OF_USE BETWEEN TO_CHAR(SYSDATE-7,'YYYY-MM-DD') AND TO_CHAR(SYSDATE,'YYYY-MM-DD') AND MEMBER_NUM=10 AND CARD_NUM='3212-8032-3960-6081'
GROUP BY TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD'),SMALL_CATE
ORDER BY USE_TIME;

SELECT TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD') AS USE_TIME,SMALL_CATE,SUM(AMOUNT_OF_BUSI) 
FROM CARD_CONSUMPTION_HISTORY
WHERE 
DATE_OF_USE BETWEEN TO_CHAR(SYSDATE-7,'YYYY-MM-DD') AND TO_CHAR(SYSDATE,'YYYY-MM-DD') AND MEMBER_NUM=10 AND CARD_NUM='8719-3196-7719-7347'
GROUP BY TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM-DD'),SMALL_CATE
ORDER BY USE_TIME;

--C���ε�� �ѹ� �ٿ�����! 
SELECT TO_CHAR(123-TO_NUMBER(SUBSTR(IDENTITY,1,2))) AS AGE,DECODE(SUBSTR(IDENTITY,8,1),'1','����','2','����') AS ����
FROM CUSTOMER_INFO
ORDER BY MEMBER_NUM;


--����ī�� �̹��� �ѹ� ����~? 
SELECT * FROM CARD_CART;
SELECT * FROM CARD_IMG;
SELECT * FROM CARD_INFO;
SELECT * FROM CARD_COMMENT;

SELECT CARD_NAME,IMG_URL,B.CARD_CATE_NUM,D.COMMENT_OF_CARD FROM 
CARD_CART A,CARD_IMG B,CARD_INFO C,CARD_COMMENT D
WHERE A.WISH_CARD = B.CARD_CATE_NUM AND A.WISH_CARD = C.CARD_CATE_NUM AND A.WISH_CARD = D.CARD_CATE_NUM AND MEMBER_NUM=10
GROUP BY CARD_NAME,IMG_URL,B.CARD_CATE_NUM,D.COMMENT_OF_CARD;


--�������� ī�� ��õ ���ֱ�
--�켱 ���� ���غ���. 

SELECT 
TO_NUMBER('20'||SUBSTR(TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),0,2)) - TO_NUMBER('19'||SUBSTR(IDENTITY,0,2))+1 AS AGE 
FROM CUSTOMER_INFO;

SELECT * FROM CARD_IMG_BENE_INFORMATION;


--���̷� �׽�Ʈ�� 
SELECT DISTINCT A.IMG_URL, A.CARD_NAME,B.CARD_OWNER,SORT_CARD 
FROM CARD_IMG_BENE_INFORMATION A,
(SELECT COUNT(*) AS CARD_OWNER,CARD_SEG_NUM
FROM CUSTOMER_CARD_INFO A,
(SELECT MEMBER_NUM 
FROM CUSTOMER_INFO
WHERE TO_NUMBER('20'||SUBSTR(TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),0,2)) - TO_NUMBER('19'||SUBSTR(IDENTITY,0,2))+1 BETWEEN 40 AND 50
ORDER BY MEMBER_NUM) B 
WHERE B.MEMBER_NUM = A.MEMBER_NUM
GROUP BY CARD_SEG_NUM
ORDER BY CARD_OWNER) B
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM
ORDER BY B.CARD_OWNER DESC; 

--�ش� �ο��� ���� �������� �׽�Ʈ�� 
SELECT DISTINCT A.IMG_URL, A.CARD_NAME,B.CARD_OWNER,SORT_CARD 
FROM CARD_IMG_BENE_INFORMATION A,
(SELECT COUNT(*) AS CARD_OWNER,CARD_SEG_NUM
FROM 
CUSTOMER_CARD_INFO A,
(SELECT MEMBER_NUM 
FROM CLUSTERED_CUSTOMER 
WHERE CLUSTERED = 
(SELECT CLUSTERED 
FROM CLUSTERED_CUSTOMER 
WHERE MEMBER_NUM = 23)) B
WHERE A.MEMBER_NUM = B.MEMBER_NUM
GROUP BY CARD_SEG_NUM) B
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM
ORDER BY B.CARD_OWNER DESC; 


SELECT COUNT(*) AS CARD_OWNER,CARD_SEG_NUM
FROM 
CUSTOMER_CARD_INFO A,
(SELECT MEMBER_NUM 
FROM CLUSTERED_CUSTOMER 
WHERE CLUSTERED = 
(SELECT CLUSTERED 
FROM CLUSTERED_CUSTOMER 
WHERE MEMBER_NUM = 23)) B
WHERE A.MEMBER_NUM = B.MEMBER_NUM
GROUP BY CARD_SEG_NUM;

SELECT MEMBER_NUM 
FROM CLUSTERED_CUSTOMER 
WHERE CLUSTERED = 
(SELECT CLUSTERED 
FROM CLUSTERED_CUSTOMER 
WHERE MEMBER_NUM = 23)
ORDER BY MEMBER_NUM;


--ī�� ���� ����ϴ� subquery��. 


SELECT DISTINCT A.IMG_URL, CARD_NAME, SORT_CARD, B.OWNER_OF_CARD
FROM 
CARD_IMG_BENE_INFORMATION A,
(SELECT COUNT(*) AS OWNER_OF_CARD,CARD_SEG_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_RES_DUE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD') AND TO_CHAR(SYSDATE,'YYYY-MM-DD')
GROUP BY CARD_SEG_NUM) B
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM
ORDER BY OWNER_OF_CARD;



SELECT DISTINCT A.IMG_URL, CARD_NAME, SORT_CARD, B.OWNER_OF_CARD
FROM 
CARD_IMG_BENE_INFORMATION A,
(SELECT COUNT(*) AS OWNER_OF_CARD,CARD_SEG_NUM 
FROM CUSTOMER_CARD_INFO
WHERE CARD_RES_DUE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-24),'YYYY-MM-DD') AND TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD')
GROUP BY CARD_SEG_NUM) B
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM
ORDER BY OWNER_OF_CARD;

SELECT * FROM CUSTOMER_INFO;

SELECT COUNT(*) 
FROM CUSTOMER_INFO
WHERE RES_DATE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-24),'YYYY-MM-DD') AND TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD');


SELECT COUNT(*) 
FROM CUSTOMER_INFO
WHERE RES_DATE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD') AND TO_CHAR(SYSDATE,'YYYY-MM-DD');

SELECT A.CUSTOMER AS THIS_YEAR_CUSTOMER ,B.CUSTOMER AS LAST_YEAR_CUSTOMER,C.CUSTOMER AS EVERY_CUSTOMER, ROUND(A.CUSTOMER/B.CUSTOMER,2) AS INCREASE_RATIO 
FROM 
(SELECT COUNT(*) AS CUSTOMER
FROM CUSTOMER_INFO
WHERE RES_DATE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD') AND TO_CHAR(SYSDATE,'YYYY-MM-DD')) A,
(SELECT COUNT(*) AS CUSTOMER
FROM CUSTOMER_INFO
WHERE RES_DATE
BETWEEN TO_CHAR(ADD_MONTHS(SYSDATE,-24),'YYYY-MM-DD') AND TO_CHAR(ADD_MONTHS(SYSDATE,-12),'YYYY-MM-DD')) B,
(SELECT COUNT(*) AS CUSTOMER
FROM CUSTOMER_INFO) C;

SELECT * FROM TRAN_INFO;

SELECT 
SUM(AMOUNT_OF_BUSI) AS SUM_AMOUNT_OF_BUSI
FROM TRAN_INFO
WHERE DATE_OF_USE BETWEEN TO_CHAR(TRUNC(SYSDATE,'dd') - 1,'yyyy-mm-dd hh24-mi-ss') AND TO_CHAR(SYSDATE,'yyyy-mm-dd hh24:mi:ss'); 


SELECT 
SUM(AMOUNT_OF_BUSI) AS SUM_AMOUNT_OF_BUSI
FROM TRAN_INFO
WHERE DATE_OF_USE BETWEEN TO_CHAR(TRUNC(SYSDATE,'dd') - 2,'yyyy-mm-dd hh24-mi-ss') AND TO_CHAR(SYSDATE-1,'yyyy-mm-dd hh24:mi:ss'); 

SELECT A.SUM_AMOUNT_OF_BUSI AS YESTERDAY_SPENT_MONEY, B.SUM_AMOUNT_OF_BUSI AS TODAY_SPENT_MONEY, B.SUM_AMOUNT_OF_BUSI/A.SUM_AMOUNT_OF_BUSI AS SPENT_MONEY_RATIO 
FROM 
(SELECT 
SUM(AMOUNT_OF_BUSI) AS SUM_AMOUNT_OF_BUSI
FROM TRAN_INFO
WHERE DATE_OF_USE BETWEEN TO_CHAR(TRUNC(SYSDATE,'dd') - 1,'yyyy-mm-dd hh24-mi-ss') AND TO_CHAR(SYSDATE,'yyyy-mm-dd hh24:mi:ss')) A,
(SELECT 
SUM(AMOUNT_OF_BUSI) AS SUM_AMOUNT_OF_BUSI
FROM TRAN_INFO
WHERE DATE_OF_USE BETWEEN TO_CHAR(TRUNC(SYSDATE,'dd') - 2,'yyyy-mm-dd hh24-mi-ss') AND TO_CHAR(SYSDATE-1,'yyyy-mm-dd hh24:mi:ss')) B; 

SELECT SUBSTR(DATE_OF_USE,0,10) AS DATE_OF_USE  FROM CARD_CONSUMPTION_HISTORY;

SELECT COUNT(DISTINCT CLUSTERED)
FROM CLUSTERED_CUSTOMER; 

SELECT SUM(AMOUNT_OF_BUSI) AS AMOUNT_OF_BUSI,TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM')||'��' AS TRAN_MONTH 
FROM CARD_CONSUMPTION_HISTORY
WHERE TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-4) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))
GROUP BY TO_CHAR(TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS'),'YYYY-MM')||'��' ORDER BY TRAN_MONTH;

SELECT * FROM TRAN_INFO;

SELECT B.GENDER,TO_NUMBER('20'||SUBSTR(TO_DATE(SYSDATE,'YYYY-MM-DD HH24:MI:SS'),0,2))-TO_NUMBER('19'||SUBSTR(B.IDENTITY,0,2))+1 AS AGE,B.IDENTITY FROM 
(SELECT * 
FROM CLUSTERED_CUSTOMER  
WHERE CLUSTERED =1) A,
CUSTOMER_INFO B
WHERE A.MEMBER_NUM = B.MEMBER_NUM;


SELECT ROUND(SUM(B.AMOUNT_OF_BUSI)/3)/COUNT(DISTINCT A.MEMBER_NUM) FROM 
(SELECT * 
FROM CLUSTERED_CUSTOMER  
WHERE CLUSTERED =1) A,
CARD_CONSUMPTION_HISTORY B
WHERE A.MEMBER_NUM = B.MEMBER_NUM
AND TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-3) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1))

SELECT B.SMALL_CATE,ROUND(SUM(B.AMOUNT_OF_BUSI)/3) AS AMOUNT_OF_BUSI,COUNT(B.SMALL_CATE) AS COUNT FROM  
(SELECT * 
FROM CLUSTERED_CUSTOMER  
WHERE CLUSTERED =1) A, CARD_CONSUMPTION_HISTORY B
WHERE A.MEMBER_NUM = B.MEMBER_NUM 
AND TO_DATE(DATE_OF_USE,'YYYY-MM-DD HH24:MI:SS') BETWEEN ADD_MONTHS(TRUNC(SYSDATE,'MM'),-3) AND LAST_DAY(ADD_MONTHS(TRUNC(SYSDATE,'MM'),-1)) 
GROUP BY B.SMALL_CATE 
ORDER BY COUNT DESC; 

SELECT * FROM CUSTOMER_INFO ORDER BY MEMBER_NUM;

SELECT * FROM CUSTOMER_INFO;

SELECT * FROM CUSTOMER_CARD_INFO;

SELECT NAME,DECODE(GENDER,'M','����','F','����') AS GENDER,PHONE_NUM, EMAIL_ADDRESS,C.CARD_NAME,DECODE(DOMESTIC_STATUS,'Y','���� ����','N','�ؿ� ����') AS DOMESTIC_STATUS FROM 
(SELECT * FROM CLUSTERED_CUSTOMER WHERE CLUSTERED = 1) A,
CUSTOMER_INFO B,
(SELECT CARD_NAME,A.MEMBER_NUM 
FROM 
CUSTOMER_CARD_INFO A,CARD_INFO B
WHERE A.CARD_SEG_NUM = B.CARD_SEG_NUM) C
WHERE A.MEMBER_NUM = B.MEMBER_NUM AND A.MEMBER_NUM = C.MEMBER_NUM; 

SELECT * FROM CUSTOMER_INFO ORDER BY MEMBER_NUM;



