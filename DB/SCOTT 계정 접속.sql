--DROP TABLE EMP;
--DROP TABLE DEPT;
--DROP TABLE LOCATIONS;
--DROP TABLE SALGRADE;

CREATE TABLE DEPT(
    DEPTNO NUMBER(2) CONSTRAINT PK_DEPT PRIMARY KEY,
	DNAME VARCHAR2(14) ,
	LOC VARCHAR2(13) 
);
CREATE TABLE EMP(
    EMPNO NUMBER(4) CONSTRAINT PK_EMP PRIMARY KEY,
	ENAME VARCHAR2(10),
	JOB VARCHAR2(9),
	MGR NUMBER(4),
	HIREDATE DATE,
	SAL NUMBER(7,2),
	COMM NUMBER(7,2),
	DEPTNO NUMBER(2) CONSTRAINT FK_DEPTNO REFERENCES DEPT
);

CREATE TABLE SALGRADE( 
    GRADE NUMBER,
	LOSAL NUMBER,
	HISAL NUMBER 
);
CREATE TABLE LOCATIONS (
     LOC_CODE  CHAR(2) ,
     CITY      VARCHAR2(12)
) ;

-- DEPT���̺� ������ ����
INSERT INTO DEPT VALUES(10,'ACCOUNTING','NEW YORK');
INSERT INTO DEPT VALUES(20,'RESEARCH','DALLAS');
INSERT INTO DEPT VALUES(30,'SALES','CHICAGO');
INSERT INTO DEPT VALUES(40,'OPERATIONS','BOSTON');

-- EMP���̺� ������ ����
INSERT INTO EMP VALUES
(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20);
INSERT INTO EMP VALUES
(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30);
INSERT INTO EMP VALUES
(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30);
INSERT INTO EMP VALUES
(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20);
INSERT INTO EMP VALUES
(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30);
INSERT INTO EMP VALUES
(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30);
INSERT INTO EMP VALUES
(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10);
INSERT INTO EMP VALUES
(7788,'SCOTT','ANALYST',7566,to_date('09-12-1982','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,10);
INSERT INTO EMP VALUES
(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30);
INSERT INTO EMP VALUES
(7876,'ADAMS','CLERK',7788,to_date('12-1-1983','dd-mm-yyyy'),1100,NULL,20);
INSERT INTO EMP VALUES
(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30);
INSERT INTO EMP VALUES
(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20);
INSERT INTO EMP VALUES
(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10);

-- SALGRADE���̺� ������ ����
INSERT INTO SALGRADE VALUES (1,700,1200);
INSERT INTO SALGRADE VALUES (2,1201,1400);
INSERT INTO SALGRADE VALUES (3,1401,2000);
INSERT INTO SALGRADE VALUES (4,2001,3000);
INSERT INTO SALGRADE VALUES (5,3001,9999);

commit; --���� ��� ������ ���������� ������ Ȯ���Ѵ�.

SELECT * FROM emp; --emp ���̺� �ִ� ������ �о ��� �÷��� ȭ�鿡 ����Ѵ�.
SELECT * FROM dept;
select empno, ename, sal, comm from emp;
select empno, sal, comm, ename from emp; --��½�, �÷��� ���ǵ� ������ �����ϴ�.

select ename, sal, sal+300 from emp;

select ename, sal, 2*sal+300 from emp;
select ename, sal, 2*(sal+300) from emp;

select empno, ename, sal, comm, comm+300 from emp;
-- comm+300���� comm ���� NULL���̸�, �� ����� NULL�� �ȴ�.

SELECT ename AS name, sal, sal*12 "Annual Salary"
FROM emp;
--26������

SELECT ename ���1, 'ABCde' ���2, sal ���3, 500 ���4
FROM emp;

SELECT ename || ':' || empno || ':' || job �̸�_���_������
FROM emp;

SELECT ename || ' is a ' || job AS "Employees Details"
FROM emp;

SELECT ename || ' : 1 Year Salary = ' || sal*12 Monthly
FROM emp; --sal*12�� ���� 1��(12����)�� ���ϸ� ������ �ȴ�.

SELECT ALL * FROM emp; --ALL�� ������ ����
SELECT * FROM emp;

SELECT DISTINCT job FROM emp; --job �÷��� ������� �ߺ� ����
SELECT DISTINCT deptno, job FROM emp;
--dept(�μ���ȣ)�� job�÷��� ���� �ߺ����� �ʰ� ���

SELECT ROWID, rownum, ename, sal
FROM emp;

SELECT ROWID, rownum, ename, sal
FROM emp
WHERE rownum<=3;

SELECT * FROM emp;

SELECT empno, ename, job, sal
FROM emp
WHERE job='MANAGER';

SELECT empno, ename, job, sal
FROM emp
WHERE job='manager'; --���� �����ʹ� ��� �빮�ڷ� ����Ǿ� �ִ�.

SELECT empno, ename, job, sal
FROM emp
WHERE sal>=3000;

SELECT ename, sal, deptno
FROM emp
WHERE deptno!=30;

SELECT ename, sal, deptno
FROM emp
WHERE deptno<>30;

SELECT ename, sal, deptno
FROM emp
WHERE deptno^=30;

SELECT ename, job, sal, deptno
FROM emp
WHERE sal BETWEEN 1300 AND 1700;
-- sal<=1700 AND sal>=1300

SELECT ename, job, sal, deptno
FROM emp
WHERE sal BETWEEN 1700 AND 1300;
-- sal<=1300 AND sal>=1700

SELECT empno, ename, job, sal, hiredate
FROM emp
WHERE empno IN(7902, 7788, 7566);
-- IN(7902, 7788, 7566)�� emp���̺� �ִ� ������ �߿��� empno���� ������ ���
-- TRUE ���� ���ϵ�.

SELECT empno, ename, job, sal, hiredate
FROM emp
WHERE empno=7902 OR empno=7788 OR empno=7566;

SELECT ename, sal, job
FROM emp
WHERE ename LIKE '_A%'; -- _�� ���� 1��, %�� ���� 0�� �̻�
-- ename�� �ι�° ���ڰ� A�� �͸� ���

SELECT ename, sal, job
FROM emp
WHERE ename LIKE '%A%'; -- ename�� 'A' ���ڰ� ���ԵǸ� TRUE�� ������.

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm = NULL; -- ����� ����. comm=NULL�� ����� NULL

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm IS NULL; -- comm�� �ִ� �����Ͱ� NULL�̸� TRUE ���� ����

SELECT empno, ename, job, sal, comm, deptno
FROM emp
WHERE comm < NULL; -- ����� ����. comm < NULL�� ����� NULL



SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 AND job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 AND job = 'Manager'; --�����ʹ� ��ҹ��� ������

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE sal >= 2800 OR job = 'MANAGER';

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE job IN('MANAGER', 'CLERK', 'ANALYST');

SELECT empno, ename, job, sal, deptno
FROM emp
WHERE job NOT IN('MANAGER', 'CLERK', 'ANALYST');

SELECT ename, sal, job
FROM emp
WHERE sal BETWEEN 1000 AND 3000;

SELECT ename, sal, job
FROM emp
WHERE sal NOT BETWEEN 1000 AND 3000;

SELECT *
FROM emp
WHERE ename NOT LIKE 'A%';

SELECT ename, sal, comm, deptno
FROM emp
WHERE comm IS NOT NULL;

SELECT ename, sal, comm, deptno
FROM emp
WHERE (NVL(comm, 0) = 0); --NVL(comm, 0)���� comm�� NULL�̸� 0������ ����

--����1(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND job = 'PRESIDENT' OR job = 'SALESMAN';

--����2(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND (job = 'PRESIDENT' OR job = 'SALESMAN');

--����3(p.43)
SELECT empno, ename, job, sal
FROM emp
WHERE sal > 1500 AND job IN('PRESIDENT', 'SALESMAN');

--����3(p.45)
SELECT empno, ename, job, sal, hiredate
FROM emp
ORDER BY hiredate; --�Ի糯¥�� ��������(����->���� ������)

SELECT empno, ename, job, sal
FROM emp
ORDER BY hiredate;

SELECT empno, ename, job, sal, hiredate
FROM emp
ORDER BY hiredate DESC;

--����2(p.45)
SELECT empno, ename, job, deptno, hiredate
FROM emp
ORDER BY deptno ASC, sal DESC;

--����3 (p. 46)
SELECT empno, ename, job, sal, deptno, hiredate
FROM emp
ORDER BY 4;

SELECT empno, ename, job, deptno, sal, hiredate
FROM emp
ORDER BY 4, 5 DESC;
--4��° �÷� deptno�� ��������, 5��° �÷� sal�� ��������

SELECT empno, sal, sal*12 ANN_SAL
FROM emp
ORDER BY ANN_SAL; -- ��Ī���� ������ �������� ����� �� �ִ�.

-- ����5 (p.47)
SELECT DISTINCT deptno, job
FROM emp
ORDER BY job; -- ������ �������� ��������

--SELECT DISTINCT deptno, job
--FROM emp
--ORDER BY sal;
-- DISTINCT�� ����� ��쿡��, SELECT ���� �ִ� �÷��� ��� ����
-- �׷��� �翬�� ���� �߻���.

SELECT DISTINCT deptno, job
FROM emp
ORDER BY deptno;

SELECT empno, sal, sal*12 ANN_SAL
FROM emp
ORDER BY deptno; -- DISTINCT�� ������� �ʾҴٸ�, emp ���̺� �ִ� ��� �÷���
-- ���� �������� ����� �� �ִ�.


SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY sal; -- sal�� �Ұ���

SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY sal+comm; -- sal+comm�� ����

SELECT DISTINCT job, sal+comm
FROM emp
ORDER BY 2;


-- p.55
-- ����1
SELECT empno, ename, job, LOWER(job), INITCAP(job)
FROM emp
WHERE deptno = 10;

-- p.56
-- ����2
SELECT empno, ename, job,
       CONCAT(empno, ename) ename1,
       CONCAT(ename, empno) e_empno,
       CONCAT(ename, job) e_job
       -- CONCAT(ename, job)�� ename�� job�� �����ؼ� �ϳ��� �÷��� �����.
FROM emp
WHERE deptno = 10;

-- ����3 // �̰� �� ���Ŵ�~!!~!!!
SELECT empno, ename, job, sal, deptno
FROM emp
WHERE SUBSTR(ename, 1, 1) > 'K' AND SUBSTR(ename, 1, 1) < 'Y'
ORDER BY ename;
-- ename�� ������ ù��° ���� 1���� ��ȯ�Ѵ�.

-- ����4
SELECT empno, ename, LENGTH(ename), sal, LENGTH(sal)
FROM emp
WHERE deptno = 20;

-- p.57
-- ����5
SELECT ename,
       INSTR(ename, 'L') e_null,
       INSTR(ename, 'L', 1, 1) e_11,
       -- ename�� ���ڿ� �����Ϳ��� 1��° ������ 'L'�ڸ� �˻��Ͽ�, ó�� �߰ߵ� 'L'�� ��ġ ��ȯ
       INSTR(ename, 'L', 1, 2) e_12,
       -- ename�� ���ڿ� �����Ϳ��� 1��° ������ 'L'�ڸ� �˻��Ͽ�, �ι�°�� �߰ߵ� 'L'�� ��ġ ��ȯ
       INSTR(ename, 'L', 4, 1) e_41
       -- ename�� ���ڿ� �����Ϳ��� 4��° ������ 'L'�ڸ� �˻��Ͽ�, ó�� �߰ߵ� 'L'�� ��ġ ��ȯ
FROM emp
ORDER BY ename;

--�ѱ� �� ����: AL32UTF-8(3Byte)
SELECT parameter, value
FROM NLS_DATABASE_PARAMETERS
WHERE  parameter='NLS_CHARACTERSET';

--���� 6
SELECT  SUBSTRB('I am here with you', 5, 3) ���1,
        -- �����ڴ� 1���ڸ� 1Byte�� �ν��ϱ� ������, 5�� ���ڿ��� 5��° ��ġ(����)�������� 3���� ���ڿ� ��ȯ
        -- '_he'
        SUBSTR('�� ���� �־�', 5, 3) ���2,
        SUBSTRB('�� ���� �־�', 5, 3) ���3,
        -- �ѱ� 1���ڴ� 3Byte�� �����Ǿ� �ֱ� ������, 5�� '��' ���ڸ� ����Ų��. 3�� 3����Ʈ�̱� ������ '��'�� ��ȯ.
        -- �ѱ� 1���ڸ� �����.
        SUBSTRB('�� ���� �־�', 5, 4) ���4,
        SUBSTRB('�� ���� �־�', 5, 5) ���5,
        SUBSTRB('�� ���� �־�', 5, 6) ���6
        -- �ѱ� 1���ڴ� 3Byte�� �����Ǿ� �ֱ� ������, 5�� '��' ���ڸ� ����Ų��. 6�� 6����Ʈ�̱� ������ '����'�� ��ȯ.
FROM dual; -- ����Ŭ���� �����ϴ� ���� ���̺�

-- ����7
SELECT  ename,
        SUBSTR(ename, 1, 3),
        -- ename�� ���ڿ� �����Ϳ��� 1��° ��ġ���� 3���� ���ڿ� ��ȯ
        SUBSTR(ename, 3),
        -- ename�� ���ڿ� �����Ϳ��� 3��° ��ġ���� ���ڿ� ������ ��ȯ
        SUBSTR(ename, -3, 2)
        -- ename�� ���ڿ� �����Ϳ��� �������� ���������Ͽ�, 3��°���� 2���� ���ڿ� ��ȯ
FROM emp
WHERE deptno = 10;

-- p.59
-- ����1
SELECT ename, LPAD(ename, 15, '*'), sal, LPAD(sal, 10, '*')
FROM emp
WHERE deptno = 10;
-- LPAD(ename, 15, '*')���� 15�� ������������ �ǹ��ϰ�, ���� �� ������ '*'�� ä��

-- ����2
SELECT ename, RPAD(ename, 15, '*'), sal, RPAD(sal, 10, '*')
FROM emp
WHERE deptno = 10;
-- LPAD(ename, 15, '*')���� 15�� ������������ �ǹ��ϰ�, ������ �� ������ '*'�� ä��

-- ����3
SELECT ename, job, LTRIM(job, 'A'), sal, LTRIM(sal, 1)
FROM emp
WHERE deptno = 20;
-- LTRIM(job, 'A')���� ������ �����Ͱ� �� ���ʿ� 'A'���ڰ� ������ ����
-- LTRIM(sal, 1)���� �޿� �����Ͱ� �� ���ʿ� ���� 1�� ������ ����
-- �����ؼ� ���� ��쿡�� ��� ������.

-- ����4
SELECT ename, job, RTRIM(job, 'T'), sal, RTRIM(sal, 0)
FROM emp
WHERE deptno = 10;
-- RTRIM(job, 'T')���� ������ �����Ͱ� �� �����ʿ� 'T'���ڰ� ������ ����
-- RTRIM(sal, 0)���� �޿� �����Ͱ� �� �����ʿ� ���� 0�� ������ ����
-- �����ؼ� ���� ��쿡�� ��� ������.

-- ����5
SELECT ename, REPLACE(ename, 'SC', '*?') AS ������
FROM emp
WHERE deptno = 20;
-- REPLACE(ename, 'SC', '*?')dptj ename ������ �߿��� 'SC'���ڿ��� ���ԵǾ��ִٸ�,
-- '*?'���� �����ؼ� �����.

-- ����6
SELECT ename, TRANSLATE(ename, 'SC', '*?') ������2
FROM emp
WHERE deptno = 20;
-- TRANSLATE(ename, 'SC', '*?')���� ename�� ������ �� 'S'->'*', 'C'->'?' ������.
-- "���ӵǾ��ִ°�"�� �������.

-- ����7
SELECT  TRIM(LEADING 'A' FROM 'AABDCADD') ���1, -- ���ڿ��� ���ʿ� �ִ� 'A'�� ����
        TRIM('A' FROM 'AABDCADD') ���2, -- ����, �����ʿ� �ִ� 'A'�� ����
        TRIM(TRAILING 'D' FROM 'AABDCADD') ���3 -- ���ڿ��� �����ʿ� �ִ� 'D'�� ����
FROM DUAL;

-- ����8
SELECT  empno, ename,
        TRANSLATE(ename, 'ABCDEFGHIJKLMNOPQRSUVWXYZ', 'abcdefghijklmnopqrsuvwxyz') u_lower
FROM emp
WHERE deptno = 10;
-- �빮�ڸ�  �ҹ��ڷ� �ٲٴ� ����.

SELECT  empno, ename,
        LOWER(ename) u_lower
FROM emp
WHERE deptno = 10;

-- p.63
-- ����1
SELECT  ROUND(4567.678) ���1, ROUND(4567.678, 0) ���2,
        ROUND(4567.678, 2) ���3, ROUND(4567.678, -2) ���4
FROM DUAL;

-- ����2
SELECT  TRUNC(4567.678) ���1, TRUNC(4567.678, 0) ���2,
        TRUNC(4567.678, 2) ���3, TRUNC(4567.678, -2) ���4
FROM DUAL; -- TRUNC�� �׳� ���� �� ����

-- ����3
SELECT  POWER(2, 10) ���1, -- 2�� 10����
        CEIL(3.7) ���2, -- �Ҽ��� ���� ù° �ڸ� �ø�
        FLOOR(3.7) ���3 -- �Ҽ��� ���� ù° �ڸ� ����
FROM DUAL;

-- p.64
-- ����4
SELECT sal, mod(sal, 30)
FROM emp
WHERE deptno = 10;

-- ����5
SELECT ename, sal, sign(sal-2975)
FROM emp
WHERE deptno = 20;

-- p.65
SELECT sysdate
FROM dual; -- ��¥�� ����

SELECT SYSTIMESTAMP
FROM dual; -- Ÿ�ӽ�����

-- ����Ŭ ��¥ ���� ��ȸ
SELECT value
FROM NLS_SESSION_PARAMETERS
WHERE parameter='NLS_DATE_FORMAT';

-- ����1
SELECT ename, hiredate, hiredate+3, hiredate + 5/24
FROM emp
WHERE deptno = 30;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';
-- ��¥ ������ ����. HH24�Ⱦ���? 12�� �⺻��...

-- ����2
SELECT  ename, hiredate, sysdate, sysdate-hiredate "Total Days",
        TRUNC((sysdate-hiredate)/7, 0) Weeks,
        ROUND (mod((sysdate-hiredate), 7), 0) DATS
FROM emp
ORDER BY sysdate-hiredate desc;

-- ����3
SELECT  EXTRACT(day from sysdate) ����, EXTRACT(month from sysdate) ��,
        EXTRACT(year from sysdate) �⵵
FROM DUAL;