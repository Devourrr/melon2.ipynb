DESC EMP;
DESC DUAL;
SELECT '010-1234-5678' AS REPLACE_BEFORE
, REPLACE('010-1234-5678','-',' ') AS REPLACE_1
, REPLACE('010-1234-5678','-') AS REPLACE_2 FROM DUAL; -- REPLACE�Լ��� ���ڿ� �ȿ� �ִ� Ư������ �ٲٱ�

SELECT 'Oracle'
, LPAD('Oracle', 10, '#') AS LPAD_1
, RPAD('Oracle', 10, '*') AS RPAD_1 -- LPAD RPAD�Լ��� �� ������ Ư�� ����'#','*'�� ä���
, LPAD('Oracle', 10) AS LPAD_2
, RPAD('Oracle', 10) AS RPAD_2 FROM DUAL; -- Ư������ �������� �������� ä����

SELECT
RPAD('971225-',14,'*') AS RPAD_SECURITY
,RPAD('010-1234-',13,'*') AS RPAD_PHONE FROM DUAL; -- �������� ���ڸ� *�� ���

SELECT CONCAT(EMPNO, ENAME) -- �� ���ڿ� �����͸� ��ġ�� CONCAT �Լ�
, CONCAT(EMPNO, CONCAT(': ', ENAME)) FROM EMP WHERE ENAME = 'SCOTT'; -- �� �� ���̿� :�ְ� �����ϱ�
-- CONCAT�� ������ ||������

SELECT '['|| TRIM(' _ _Oracle_ _ ')|| ']'AS TRIM -- Ư�� ���ڸ� �����TRIM( LEADING, TRAILING, BOTH)�Լ�. ������ ���ڰ� ���� �� ��������
, '['|| TRIM(LEADING FROM' _ _Oracle_ _ ')|| ']'AS TRIM_LEADING     --���� ���� ����
, '['|| TRIM(TRAILING FROM' _ _Oracle_ _ ')|| ']'AS TRIM_TRAILING  -- ������ ���� ����
, '['|| TRIM(BOTH FROM' _ _Oracle_ _ ')|| ']'AS TRIM_BOTH FROM DUAL; --���� ���� ����

SELECT '['|| TRIM('_' FROM ' _ _Oracle_ _ ')|| ']'AS TRIM -- Ư�� ���ڸ� ����� TRIM, LTRIM, RTRIM�Լ�. ������ ���ڰ� ���� �� '_'����
, '['|| TRIM(LEADING '_' FROM ' _ _Oracle_ _ ')|| ']'AS TRIM_LEADING     --���� '_' ����
, '['|| TRIM(TRAILING '_' FROM ' _ _Oracle_ _ ')|| ']'AS TRIM_TRAILING  -- ������ '_' ����
, '['|| TRIM(BOTH '_' FROM' _ _Oracle_ _ ')|| ']'AS TRIM_BOTH FROM DUAL; -- ���� '_' ����

SELECT '['|| TRIM(' _Oracle_ ') || ']' AS TRIM
,'[' || LTRIM(' _Oracle_ ') || ']' AS LTRIM
,'[' || LTRIM('<_Oracle_>','_<') || ']' AS LTRIM_2
,'[' || RTRIM(' _Oracle_ ') || ']' AS RTRIM
,'[' || RTRIM('<_Oracle_>') || ']' AS RTRIM_2 FROM DUAL; -- TRIM, LTRIM, RTRIM ����Ͽ� ���ڿ� ����ϱ�

SELECT ROUND(1234.5678) AS ROUND -- �ݿø���ġ ������ = 0���� ����
, ROUND(1234.5678,0) AS ROUND_0 
, ROUND(1234.5678,1) AS ROUND_1 -- �ݿø���ġ�� �Ҽ��� ù��°
, ROUND(1234.5678,2) AS ROUND_2
, ROUND(1234.5678,-1) AS ROUND_MINUS1 -- �ݿø���ġ�� �ڿ��� ù��°
, ROUND(1234.5678,-2) AS ROUND_MINUS2 FROM DUAL; -- ROUND�Լ� ����Ͽ� �ݿø��� ���� ����ϱ�

SELECT TRUNC(1234.5678) AS TRUNC -- �Ҽ�����ġ ������ = 0��° ����
, TRUNC(1234.5678, 0) AS TRUNC_0 
, TRUNC(1234.5678, 1) AS TRUNC_1 -- �Ҽ��� ù��° ����
, TRUNC(1234.5678, 2) AS TRUNC_2
, TRUNC(1234.5678, -1) AS TRUNC_MINUS1 -- �ڿ��� ù��° ����
, TRUNC(1234.5678, -2) AS TRUNC_MINUS2 FROM DUAL; --TRUNC�Լ� ����Ͽ� ���� ���

SELECT CEIL(3.14) -- 3.14���� ū ���� �� ���� ����� ����
, FLOOR(3.14) -- 3.14���� ���� ���� �� ���� ����� ����
,CEIL(-3.14)
,FLOOR(-3.14) FROM DUAL; -- CEIL �Լ��� ����� ���� ���

SELECT MOD(15,6)
, MOD(10,2)
, MOD(11,2) FROM DUAL; -- ������ ���� ������ִ� MOD �Լ�

SELECT SYSDATE AS NOW -- ��¥�� ������ִ� SYSDATE �Լ�
, SYSDATE -1 AS YESTERDAY -- SYSDATE -1 =����
, SYSDATE+1 AS TOMORROW FROM DUAL; -- SYSDATE +1 = ����

SELECT SYSDATE
,ADD_MONTHS(SYSDATE, 3) FROM DUAL; -- ��� �� ��¥�� ���ϴ� ADD_MONTHS �Լ�

SELECT EMPNO, ENAME, HIREDATE
, ADD_MONTHS(HIREDATE, 120) AS WORK10YEAR FROM EMP; -- ADD_MONTHS�Լ��� 10�ֳ� ���� ������ ��ȸ

SELECT EMPNO, ENAME, HIREDATE, SYSDATE FROM EMP
WHERE ADD_MONTHS(HIREDATE,480) > SYSDATE; --WHERE ���� ADD_MONTHS �Լ� ����Ͽ� �Ի� 32�� �̸� ��� ������ ��ȸ

SELECT SYSDATE
, ADD_MONTHS(SYSDATE,6) FROM DUAL;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE -- MONTHS_BETWEEN(A,B)�Լ��� �� ��¥�� ���� �� ���� ����ϱ�
, MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS1 -- �� ��¥ �Է� ��ġ�� ���� ����/��� �Ҽ��� �������� ��� ���
, MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2
, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTHS3 FROM EMP;  --TRUNC�Լ� �������� ���� ���

SELECT SYSDATE
, NEXT_DAY(SYSDATE, '������') -- NEXT_DAY(��¥,����) �Լ��� ��¥ �����Ϳ��� ���ƿ��� ���� ��¥ ��ȯ
, LAST_DAY(SYSDATE) FROM DUAL; -- LAST_DAY(��¥) �Լ��� �ش� ��¥ ���� ���� ������ ��¥ ��ȯ

SELECT SYSDATE
, ROUND(SYSDATE,'CC') AS FORMAT_CC
, ROUND(SYSDATE,'YYYY') AS FORMAT_YYYY
, ROUND(SYSDATE,'Q') AS FORMAT_Q
, ROUND(SYSDATE,'DDD') AS FORMAT_DDD
, ROUND(SYSDATE,'HH') AS FORMAT_HH FROM DUAL; -- ROUND �Լ� ��� ��¥ ������ ���

SELECT SYSDATE
, TRUNC(SYSDATE,'CC') AS FORMAT_CC
, TRUNC(SYSDATE,'YYYY') AS FORMAT_YYYY
, TRUNC(SYSDATE,'Q') AS FORMAT_Q
, TRUNC(SYSDATE,'DDD') AS FORMAT_DDD
, TRUNC(SYSDATE,'HH') AS FORMAT_HH FROM DUAL; -- TRUNC �Լ� ��� ��¥ ������ ���

SELECT EMPNO, ENAME, EMPNO + '500' FROM EMP -- �ڵ� �� ��ȯ, �Ͻ��� �� ��ȯ( ���ڷ� �ν� ������ ���� �����Ͱ� �ڵ����� ���ڷ� �ٲ� �� ���� ����)
WHERE ENAME = 'SCOTT'; -- ���ڿ� + ���ڿ�(����) ���Ͽ� ���

SELECT 'ABCD' + EMPNO, EMPNO FROM EMP WHERE ENAME = 'SCOTT'; -- ����ó�� ������ ���� ���� �����ʹ� �ڵ� �� ��ȯ ���� ��밡 �����
-- ����� ���� ����ȯ, ����� �� ��ȯ CHAR �� NUMBER �� DATE ��ȯ ����
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH24:MI:SS') AS ���糯¥�ð� FROM DUAL;
SELECT SYSDATE
, TO_CHAR(SYSDATE, 'MM') AS MM
, TO_CHAR(SYSDATE, 'MON') AS MON
, TO_CHAR(SYSDATE, 'MONTH') AS MONTH -- ��
, TO_CHAR(SYSDATE, 'DD') AS DD -- ��¥
, TO_CHAR(SYSDATE, 'DY') AS DY -- ����
, TO_CHAR(SYSDATE, 'DAY') AS DAY FROM DUAL; -- SYSDATE ������ ���ڷ� ��ȯ

SELECT SYSDATE
, TO_CHAR(SYSDATE,'MM') AS MM
, TO_CHAR(SYSDATE,'MON', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR -- TO_CHAR(SYSDATE,'FORMAT' 'NLS_DATE_LANGUAGE = ')
, TO_CHAR(SYSDATE,'MON', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN
, TO_CHAR(SYSDATE,'MON', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG
, TO_CHAR(SYSDATE,'MONTH', 'NLS_DATE_LANGUAGE = KOREAN') AS MON_KOR
, TO_CHAR(SYSDATE,'MONTH', 'NLS_DATE_LANGUAGE = JAPANESE') AS MON_JPN
, TO_CHAR(SYSDATE,'MONTH', 'NLS_DATE_LANGUAGE = ENGLISH') AS MON_ENG FROM DUAL; --���� ���� ��¥(��) ����ϱ�

SELECT SYSDATE
, TO_CHAR(SYSDATE, 'MM') AS MM
, TO_CHAR(SYSDATE, 'DD') AS DD
, TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR
, TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN
, TO_CHAR(SYSDATE, 'DY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG
, TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = KOREAN') AS DY_KOR
, TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = JAPANESE') AS DY_JPN
, TO_CHAR(SYSDATE, 'DAY', 'NLS_DATE_LANGUAGE = ENGLISH') AS DY_ENG FROM DUAL; -- ���� ���� ��¥(����) ����ϱ�

SELECT SYSDATE
, TO_CHAR(SYSDATE , 'HH24:MI:SS') AS HH24MISS
, TO_CHAR(SYSDATE , 'HH24:MI:SS AM') AS HH24MISS_AM
, TO_CHAR(SYSDATE , 'HH24:MI:SS P.M.') AS HH24MISS_PM FROM DUAL; -- �ð� ���� �����Ͽ� ����ϱ�

SELECT SAL
, TO_CHAR(SAL, '$999,999') AS SAL_$
, TO_CHAR(SAL, 'L999,999') AS SAL_L
, TO_CHAR(SAL, '999,999.00') AS SAL_1
, TO_CHAR(SAL, '000,999,999.00') AS SAL_2
, TO_CHAR(SAL, '000999999.99') AS SAL_3
, TO_CHAR(SAL, '999,999,00') AS SAL_4 FROM EMP;

SELECT 1300 - '1500' -- ���ڵ����� + ���ڵ����� ���� ���
,'1300' +1500 FROM DUAL; -- ���ڵ����ͳ����� ����Ұ�

SELECT TO_NUMBER('1,300','999,999') - TO_NUMBER('1,500', '999,999') FROM DUAL; -- TO_NUMBER�Լ��� ���ڵ����� ����

SELECT TO_DATE('2018-07-14', 'YYYY-MM-DD') AS TODATE1 --TO_DATE('���ڿ�������', '�νĵ� ��¥ ����)
, TO_DATE('20180714', 'YYYY-MM-DD') AS TODATE2 FROM DUAL;-- ���� �����͸� ��¥ �����ͷ� ��ȯ�ϱ�

SELECT * FROM EMP
WHERE HIREDATE > TO_DATE('1981/06/01','YYYY/MM/DD'); --1981/06/01 ���Ŀ� �Ի��� ������� ����ϱ�

SELECT TO_DATE('49/12/10', 'YY/MM/DD') AS YY_YEAR_49
, TO_DATE('49/12/10', 'RR/MM/DD') AS YY_YEAR_49
, TO_DATE('50/12/10', 'YY/MM/DD') AS YY_YEAR_50
, TO_DATE('50/12/10', 'RR/MM/DD') AS YY_YEAR_50
, TO_DATE('51/12/10', 'YY/MM/DD') AS YY_YEAR_51
, TO_DATE('51/12/10', 'RR/MM/DD') AS YY_YEAR_51 FROM DUAL;

SELECT * FROM EMP WHERE HIREDATE > TO_DATE('1980/10/15', 'YYYY/MM/DD');

SELECT EMPNO, ENAME, SAL, COMM, SAL+COMM
, NVL(COMM,0)
, SAL+NVL(COMM,0) FROM EMP; --NULL ���ο� ���� �״�� ��ȯ�ϰų� ������ ���� ��ȯ�ϴ� NVL�Լ�

SELECT EMPNO, ENAME, COMM
, NVL2(COMM, '0', 'X')
, NVL2(COMM, SAL*12+COMM, SAL*12) AS ANNSAL FROM EMP; -- NULL�� �ƴ� ���, NULL�� ��� ��ȯ�����͸� �����ϴ� NVL2�Լ�

SELECT EMPNO, ENAME, JOB, SAL
,DECODE(JOB -- �˻� ����� �� �� �Ǵ� ������, �����̳� �Լ��� ���
,'MANAGER', SAL*1.1 -- JOB = 'MANAGER' ��� 10%�λ��� �޿�
,'SALESMAN', SAL*1.05 -- JOB = 'SALESMAN' ��� 5% �λ��� �޿�
,'ANALYST', SAL -- JOB = 'ANALYST' �� ��� �״��  
,SAL*1.03) AS UPSAL FROM EMP; -- �������� 3%�λ��� �޿� ����ϴ� DECODE�Լ�, �� ������ ������ ��ȯ �� �������� NULL��ȯ

SELECT EMPNO, ENAME, JOB, SAL
,CASE JOB -- �˻� ����� �� �� �Ǵ� ������, �����̳� �Լ��� ���
WHEN 'MANEGER' THEN SAL*1.1 -- JOB = 'MANAGER' ��� 10%�λ��� �޿� 
WHEN 'SALESMAN' THEN SAL*1.05 -- JOB = 'SALESMAN' ��� 5% �λ��� �޿�
WHEN 'ANALYST' THEN SAL -- JOB = 'ANALYST' �� ��� �״�� 
ELSE SAL * 1.03 -- �������� 3%�λ��� �޿� ����ϴ� CASE��, �� ���ǿ� ����ϴ� �����Ͱ� ���� ������ �Ǹ� ���� ������ ���� ���� ������ �ܿ� �پ��� ���� ��밡��
END AS UPSAL FROM EMP; -- DECODE�Լ����� ���� ���뼺

SELECT EMPNO, ENAME, COMM
,CASE
WHEN COMM IS NULL THEN 'NULL'
WHEN COMM = 0 THEN '�������'
WHEN COMM > 0 THEN ' ���� :' || COMM
END AS COMM_TEXT FROM EMP; -- �� ���� ���� ��� ���� �޶����� CASE��



