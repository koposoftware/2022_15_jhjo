
--20�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO 
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 20 AND 29 AND SUBSTR(IDENTITY,8,1) = '1';


--20 �� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO 
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 20 AND 29 AND SUBSTR(IDENTITY,8,1) = '2';

--30�� ����
SELECT COUNT(*)
FROM CUSTOMER_INFO 
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 30 AND 39 AND SUBSTR(IDENTITY,8,1) = '1';

--30�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO 
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 30 AND 39 AND SUBSTR(IDENTITY,8,1) = '2';

--40�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 40 AND 49 AND SUBSTR(IDENTITY,8,1) = '1';

--40�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 40 AND 49 AND SUBSTR(IDENTITY,8,1) = '2';

--50�� ����
SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 50 AND 59 AND SUBSTR(IDENTITY,8,1) = '1';

--50�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 50 AND 59 AND SUBSTR(IDENTITY,8,1) = '2';

--60�� ���� 
SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 60 AND 69 AND SUBSTR(IDENTITY,8,1) = '1';

SELECT COUNT(*)
FROM CUSTOMER_INFO
WHERE 123-TO_NUMBER(SUBSTR(IDENTITY,1,2)) BETWEEN 60 AND 69 AND SUBSTR(IDENTITY,8,1) = '1';