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
show user; --> 현재 사용중인 계정 확인
-- 203 제어계측공학과 ---> 컴퓨터공학과


update department set dname = '컴퓨터공학과' where deptno=203;
delete from department where dname = '컴퓨터공학과';
select deptno, dname, college, loc from department;