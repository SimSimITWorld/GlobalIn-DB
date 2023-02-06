/*
  ������
    - �������� ������ �� ������ �ִ� ����Ŭ ��ü
      �������� �����ϸ� �⺻Ű�� ���� ���������� �����ϴ� �÷��� �ڵ������� ������ �� �ְ� ��
      
  ������ ���� ����
  
  CREATE SEQUENCE �������̸�
  START WITH N
  INCREMENT BY N
  MAXVALUE N / NOMAXVALUE                                      NOMAXVALUE = ���Ѵ밪
  MINVALUE N / NOMINVALUE                                      NOMINVALUE = ���ѼҰ�
  CYCLE      / NOCYCLE
  CACHE      / NOCACHE;
  
  
  
  1. START WITH N
    - �������� ���۰��� ������
      N �� 1 �� �����ϸ� 1���� ���������� ����
      
  2. INCREMENT BY N
    - �������� �������� ������
      1�� �ϸ� 1�� �����ϰ�, 2���ϸ� 2�� ����
      
  3. MAXVALUE N / NOMAXVALUE 
    - �ִ밪 ����/ ���Ѵ�� ����
    
  4. MINVALUE N / NOMINVALUE  
    - �ּҰ� ����/ ���Ѽ� ����
    
  5. CYCLE      / NOCYCLE
    - �ִ밪���� �����ϸ� �ٽ� �ּҰ����� �����ϵ��� ����
      �⺻���� NOCYCLE
      
  6. CACHE      / NOCACHE;
    - ����Ŭ���� �̸� ������ ���� �޸� ��
      �⺻���� 2
*/

-- ���۰��� 1�̰� 1�� �����ϰ� �ִ밪�� 1000000�� �Ǵ� ������ EMP_SEQ�� �����Ͻÿ�


-- ������ ����
CREATE SEQUENCE EMP_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 10000000;


SELECT * FROM EMP;
DROP SEQUENCE EMP_SEQ;

-- ����ִ� ���̺� ����
CREATE TABLE EMP10 AS SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE 1=0;


DROP TABLE EMP10;
INSERT INTO EMP10 VALUES(1, 'JULIA', SYSDATE);

-- ������ �߰�
INSERT INTO EMP10 VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);


SELECT * FROM EMP10;

-- ���� ���� ��ȯ : CURRVAL
SELECT EMP_SEQ.CURRVAL FROM DUAL;

-- ���� �������� ���� ���� ��ȯ�� : NEXTVAL
SELECT EMP_SEQ.NEXTVAL FROM DUAL;


DELETE FROM EMP10;
ROLLBACK;

-- �������� Ȯ���ϴ� ���
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM USER_SEQUENCES;
SELECT EMP_SEQ.NEXTVAL FROM DUAL;

/*
  NEXTVAL, CURRVAL �� ����� �� �ִ� ���
    1. ���������� �ƴ� SELECT��
    2. INSERT���� SELECT��
    3. INSERT VALUES���� ���
    4. UPDATE���� SET��
  
  NEXTVAL, CURRVAL �� ����� �� ���� ���
    1. VIEW�� SELECT��
    2. DISTINCT Ű���尡 �ִ� SELECT��
    3. GROUP BY, HAVING, ORDER BY���� �ִ� SELECT��
    4. SELECT, DELETE, UPDATE�� ��������
    5. CREATE TABLE, ALTER TABLE ���
    
  ������ ���� �����Ϸ��� ALTER SEQUENCE
  
  ALTER SEQUENCE EMP_SEQ
  INCREMENT BY N
  MAXVALUE N / NOMAXVALUE
  MINVALUE N / NOMINVALUE
  CYCLE / NOCYCLE
  CACHE / NOCACHE
  
*/

ALTER SEQUENCE EMP_SEQ
INCREMENT BY 10
MAXVALUE 1000000;
SELECT EMP_SEQ.NEXTVAL FROM DUAL;

SELECT EMP_SEQ.CURRVAL FROM DUAL;


CREATE VIEW VIEW_EMP12
AS SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE DEPTNO=10;

SELECT * FROM TAB;
DESC EMP;

SELECT * FROM VIEW_EMP10;

/*
  ���� ����
    - ���ٶ�� �ǹ̸� ���� �ִ� ���� �����ؼ� ���� ���̺�(�������̺�)�� ����� �����͸� �並 ���ؼ� �� �� �ִ�.
      �並 ���� ���̺��̶�� ��(���̺�� ���� �����ϰ� ���Ǳ� ����)  
    - ��� �������� ������ ���̺�� �޸� ������ ��������� ����.
    - ��� ���� �������� �����ϰ� �ִ� ��ü��� ǥ���� �� �ִ�.
    
  ���� ������
    - �������� ���̺� ������ �����ϱ� ���� ����Ѵ�.
    - ������ ���Ǹ� ���� ����� ���ؼ� ����Ѵ�.
    
  ���� Ư¡
    - ��� ���̺� ���� ������ ������ ���̺��� ������ �κи� ���� �� �ִ� ������ ���̺�
    - ��� ���� �����͸� ������ ���� ������, �並 ���ؼ� ���̺��� ������ �� �ִ�.
    - �ϳ��� ���̺� ���� ������ ������ ����.
    
  ��� CREATE���� �̿��Ͽ� ����
  
  �⺻ ���̺�
    - �信 ���� ���������� �����ؼ� ����ϴ� ���������� �����͸� �����ϰ� �ִ� �������� ���̺��� �ǹ�
*/

SELECT * FROM EMP01;
DROP TABLE EMP01;
CREATE TABLE EMP01
AS SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01 WHERE DEPTNO=10;

/*
  ���� ����
    - ��� ���̺�ó�� �ϳ��� ��ü�μ� ���̺��� ������ ���� �����ϰ� CREATE VIEW ������� �����Ѵ�.
    
    CREATE [OR REPLACE][FORCE | NO FORCE] VIEW VIEW_NAME
    AS SUBQUERY
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    
    
    OR REPLACE : ���ο� �並 ���� �� ���� �Ӹ� �ƴ϶� ������ �䰡 �����ϴ��� �������� �ʰ� ���ο� ������ ��� ������ �� �ִ�.
    
    FORCE | NOFORCE : �⺻ ���̺��� ���翩�ο� ������� �並 �����Ѵ�.
    
    WITH CHECK OPTION : �ش� �並 ���ؼ� �� �� �ִ� ���� �������� UPDATE OR INSERT ����� �����ϴ�.
    
    WITH READ ONLY : �ش� �並 ���ؼ��� SELECT�� ����(INSERT/UPDATE/DELETE ��ɾ�� ����� �� ����.)
    
    
  ���� ���� ����
    - ����ڰ� �信 ���ؼ� ���Ǹ� �ϸ� USER_VIEWS���� �信 ���� ��ȸ�� �� �� �ִ�.
    - �⺻ ���̺� ���� ���� ���� ������ ����
    - �信 ���� ���Ǹ� �⺻ ���̺� ���� ���Ƿ� ��ȯ��
    - �⺻ ���̺� ���� ���Ǹ� ���ؼ� �����͸� �˻���
    - �˻��� ����� ���
    
    
  ���� ����
    - �⺻ ���̺��� ���� ���� �ܼ���� ���պ�� ��������
    
          �ܼ���                                    ���պ�
     �ϳ��� ���̺�� ����                     �������� ���̺�� ����     
     �׷��Լ� ���Ұ�                        �׷��Լ� ��밡��
     DISTINCT ���Ұ�                        DISTINCT ��밡��
     DML(����, ����, ����)��밡��             DML ���Ұ� 
*/

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;

DROP VIEW VIEW_EMP10;
SELECT * FROM VIEW_EMP10;

CREATE VIEW VIEW_EMP10
AS SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01
WHERE DEPTNO=10;

INSERT INTO VIEW_EMP10 VALUES(8000, 'ANGEL', 7000, 10);
DELETE FROM VIEW_EMP10 WHERE EMPNO = 8000;
-- �ܼ��並 ������� ������ DML ��ɹ��� ó�� ����� �並 ������ �� ����� �⺻ ���̺� ������ ��ģ��.

SELECT * FROM EMP01;
ROLLBACK;

DESC VIEW_EMP10;


--�ܼ� ���� �÷��� ��Ī ����ϱ�
CREATE OR REPLACE VIEW VIEW_EMP(�����ȣ, �����, �޿�, �μ���ȣ)
AS SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01;

SELECT * FROM VIEW_EMP;



-- �׷��Լ��� ����� �ܼ���
-- �μ��� �޿� �Ѿװ� ����� ���ϴ� �۾��� ��� �����س��� ����ϱ� ����
CREATE VIEW VIEW_SAL 
AS SELECT DEPTNO, SUM(SAL) "SalSum", avg(sal) "SalAvg" from emp01
GROUP BY DEPTNO;

SELECT * FROM VIEW_SAL;


-- ���� �� : �� �� �̻��� �⺻ ���̺� ���� ������ ��
SELECT * FROM TAB;

PURGE RECYCLEBIN;

SELECT * FROM DEPT01;
SELECT * FROM EMP01;

DROP TABLE DEPT01;
DROP TABLE DEPT02;

CREATE TABLE DEPT01
AS
SELECT * FROM DEPT;

CREATE VIEW VIEW_EMP_DEPT AS SELECT E.EMPNO, E.ENAME, E.SAL, E.DEPTNO, D.DNAME, D.LOC FROM EMP01 E, DEPT01 D WHERE E.DEPTNO=D.DEPTNO ORDER BY EMPNO DESC;

SELECT * FROM VIEW_EMP_DEPT;

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;
DROP VIEW VIEW_SAL;

CREATE OR REPLACE VIEW VIEW_EMP10 AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP01 WHERE DEPTNO=10;

CREATE OR REPLACE FORCE VIEW VIEW_NOTABLE AS SELECT EMPNO, ENAME, DEPTNO FROM AAAA WHERE DEPTNO=10;

SELECT * FROM VIEW_NOTABLE;
SELECT * FROM AAAA;


-- WITH CHECK OPTION
-- �� ������ �������� ������ �÷� ���� �������� ���ϵ��� �ϴ� ���� �ǹ���
CREATE OR REPLACE VIEW VIEW_CHK20
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP01 WHERE DEPTNO=20 WITH CHECK OPTION;


SELECT * FROM VIEW_CHK20;

-- �޿��� 5000�̻��� ����� 10�� �μ��� �̵��ϴ� �������� �ۼ��Ͻÿ�.
UPDATE VIEW_CHK20 SET DEPTNO=10 WHERE SAL>=5000;

SELECT * FROM VIEW_CHK20;


-- WITH READ ONLY
-- �並 ���ؼ��� �⺻���̺��� � �÷��� ���ؼ��� ������ ���� ������ �� ������ �ϴ� ���� �ǹ���
CREATE OR REPLACE VIEW VIEW_READ30
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP01 WHERE DEPTNO=30 WITH READ ONLY;

SELECT * FROM VIEW_READ30;
UPDATE VIEW_READ30 SET COMM=1000;


/*
  WITH CHECK OPTION
    - ���ǿ� ����� �÷��� ���� �������� ���ϰ� ��
    
  WITH READ ONLY
    - �⺻ ���̺��� ��θ� �������� ���ϰ� �ϴ� ��
*/