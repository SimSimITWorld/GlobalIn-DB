SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT01';
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT01', 'EMP01');

SELECT * FROM EMP01;
SELECT * FROM DEPT01;

-- DEPT01 ���̺��� �⺻Ű�� ��Ȱ��ȭ �Ѵ�. (�Ұ���)
ALTER TABLE DEPT01
DISABLE PRIMARY KEY;  -- �Ұ���
-- DEPT01 ���̺��� �⺻Ű�� EMP01 ���̺��� �ܷ�Ű���� �����ϰ� �ֱ� ������
-- ���������� ��Ȱ��ȭ �� �� ����.
ALTER TABLE EMP01
ENABLE PRIMARY KEY;




-- �θ����̺�� �ڽ����̺��� ���ÿ� ��Ȱ��ȭ
ALTER TABLE DEPT01
DISABLE PRIMARY KEY CASCADE;

ROLLBACK;

-- �θ����̺�� �ڽ����̺��� ���ÿ� Ȱ��ȭ�� �Ұ���(���ε��� Ȱ��ȭ ���������)
ALTER TABLE EMP01
ENABLE PRIMARY KEY;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT01', 'EMP01');

ALTER TABLE DEPT01
DROP PRIMARY KEY CASCADE; -- �ƿ� ���� �� �� ���

ROLLBACK;



/*
  ����
    - �� �� �̻��� ���̺��� ���ϴ� ����� ��� ���� ���
    
      Equi Join     : ������ �÷��� �������� ������
      Non Equi Join : ������ �÷� ���� �ٸ� ������ ����Ͽ� ����(�� ���̺� ����� �÷��� ���� �� ���)
      Outer Join    : ���� ���ǿ� �������� �ʴ� �൵ ��Ÿ��(�����)
      Self Join     : �� ���̺� ������ ������
      
      emp a, emp b
*/

-- Equi Join
SELECT ENAME, DNAME FROM EMP01, DEPT01 WHERE EMP01.DEPTNO=DEPT01.DEPTNO;




-- Non Equi Join�� ������ ���̺� ���̿� �÷��� ���� ���������� ��ġ���� ���� ��
-- ����ϴ� �������� '='�� ������ �����ڸ� ����Ѵ�.
SELECT * FROM salgrade; 
SELECT * FROM EMP01;

SELECT E.ENAME �̸�, E.SAL �޿�, S.GRADE ��� FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;



-- Outer Join : ���� ���� ���ǿ� �������� ���� ��� �� ���� �����
--              ��Ÿ���� �ʰ� ��, �� �� ���� ���ǿ� �������� �ʴ� 
--              ��鵵 ��Ÿ���� ��

SELECT * FROM DEPT01;
SELECT * FROM EMP;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT01 D 
WHERE E.DEPTNO(+)=D.DEPTNO;



-- Ư�� ����� ����ϴ� �Ŵ��� ����� �̸��� ���
SELECT ENAME, MGR FROM EMP;
SELECT WORK.ENAME ���, MANAGER.ENAME �Ŵ���
FROM EMP WORK, EMP MANAGER
WHERE WORK.MGR=MANAGER.EMPNO;


/*
  ��������
    ���������� �ϳ��� SELECT ������ �� �ȿ� ���Ե� �� �ϳ��� SELECT ���� �ǹ��Ѵ�.
      -����(��), ����(��)
*/

-- SCOTT�� �μ����� �˾ƺ����� �Ѵ�
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT';

-- �μ���ȣ�� 20���̸� �μ��̸��� �˾Ƴ� �� ����
SELECT DNAME FROM DEPT;

SELECT DNAME FROM DEPT WHERE DEPTNO=20;

SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
--            ��������               (                ��������                  );

/*
  ������ �������� : ���� SELECT �������κ��� ���� �ϳ��� �ุ�� ��ȯ�Ѵ�.
                   ��뿬���� : �񱳿����� ( >, <, >=, <=, =, !=, <> )
                   
  ������ �������� : ������������ ��ȯ�Ǵ� ����� �ϳ� �̻��� ���϶��� �ǹ���
                   ��뿬���� : IN, (ANY, SOME), ALL, EXIST
*/

/*
  IN ������ : �� �� �ϳ� (OR��)
  
    - �޿��� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ����� ����Ͻÿ�.
*/
SELECT DISTINCT DEPTNO FROM EMP WHERE SAL>=3000;
SELECT ENAME, SAL, DEPTNO FROM EMP;

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN(SELECT DISTINCT DEPTNO FROM EMP WHERE SAL>=3000);


/*
  ALL ������ : ���������� �������� ���������� �˻������ ��� ���� ��ġ�ϸ� ��
    
    - 30�� �Ҽ� ����� �߿��� �޿��� ���� ���� �޴� ������� �� ���� �޿��� �޴� ����� �̸��� �޿��� ���
*/
SELECT * FROM EMP;
SELECT ENAME, SAL FROM EMP WHERE SAL>=2850;
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30;

SELECT ENAME, SAL FROM EMP WHERE SAL > ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

/*
  ANY ������ : ���� ������ �� ������ ���� ������ �˻� ����� �ϳ� �̻� ��ġ�ϸ� ��
               ��, ã���� ������ ���� ���� ��(�ּҰ�)���� ũ�� ���� �ȴ�.
               
    - �μ���ȣ�� 30���� ������� �޿� �� ���� ���� �� ���� ���� �޿��� �޴� ����� �̸��� �޿��� ����Ͻÿ�.
*/
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30; -- ��������
SELECT ENAME, SAL FROM EMP;
SELECT ENAME, SAL FROM EMP WHERE SAL>ANY(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);

-- ���̺� ���� �� �������� ��� ����
CREATE TABLE EMP08 AS SELECT * FROM EMP;

DROP TABLE EMP08;
DESC EMP;
SELECT * FROM EMP08;
SELECT * FROM TAB;
PURGE RECYCLEBIN;

-- ���̺� ������ ����
-- 1=0 : ����
CREATE TABLE EMP08 AS SELECT * FROM EMP WHERE 1=0;


CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
DROP TABLE DEPT02;
SELECT * FROM DEPT02;
SELECT * FROM DEPT;

-- �������������� ������ �� VALUES�� ������� ����
INSERT INTO DEPT02 SELECT * FROM DEPT;

SELECT * FROM  DEPT02;

/*
  10�� �μ��� �������� 40�� �μ��� ���������� �����Ͻÿ�
  NEW YORK --> BOSTON
*/
UPDATE DEPT02 SET LOC=(SELECT LOC FROM DEPT02 WHERE DEPTNO=40) WHERE DEPTNO=10;
ROLLBACK;


/*
20�� �μ���� �������� 30�� �μ��� �μ���� ���������� �����Ͻÿ�.
*/
UPDATE DEPT02 SET (DNAME, LOC)=(SELECT DNAME, LOC FROM DEPT02 WHERE DEPTNO=30) WHERE DEPTNO=20;

CREATE TABLE EMP09 AS SELECT * FROM EMP;

SELECT * FROM EMP09;
SELECT DEPTNO, DNAME FROM DEPT01;

-- �μ� ��ȣ�� �˻� : 30
SELECT DEPTNO FROM DEPT01 WHERE DNAME='SALES';

DELETE FROM EMP09 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT01 WHERE DNAME='SALES');


SELECT * FROM DEPT01;
DELETE FROM DEPT01 WHERE DEPTNO=20;
COMMIT;
ROLLBACK;
-- COMMIT �Ŀ��� ROLLBACK �� �ص� �ҿ��� ����.



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
START WITH 1
INCREMENT BY 1
MAXVALUE 1000000;


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
*/