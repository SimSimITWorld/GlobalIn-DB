select * from tab;

CREATE TABLE DEPARTMENT (
DEPTNO NUMBER(3) NOT NULL,
DNAME VARCHAR2(30) NOT NULL,
COLLEGE NUMBER(3) NOT NULL,
LOC VARCHAR2(10) NOT NULL,
CONSTRAINT DEPARTMENT_PK PRIMARY KEY(DEPTNO)
);

DESC DEPARTMENT;
COMMIT;

SELECT * FROM DEPARTMENT;
DELETE FROM DEPARTMENT;
show user; --> ���� ������� ���� Ȯ��
-- 203 ����������а� ---> ��ǻ�Ͱ��а�


update department set dname = '��ǻ�Ͱ��а�' where deptno=203;
delete from department where dname = '��ǻ�Ͱ��а�';
select deptno, dname, college, loc from department;