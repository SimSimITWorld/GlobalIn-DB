/*
  시퀀스
    - 시퀀스는 유일한 값 생성해 주는 오라클 객체
      시퀀스를 생성하면 기본키와 같이 순차적으로 증가하는 컬럼을 자동적으로 생성할 수 있게 됨
      
  시퀀스 생성 형식
  
  CREATE SEQUENCE 시퀀스이름
  START WITH N
  INCREMENT BY N
  MAXVALUE N / NOMAXVALUE                                      NOMAXVALUE = 무한대값
  MINVALUE N / NOMINVALUE                                      NOMINVALUE = 무한소값
  CYCLE      / NOCYCLE
  CACHE      / NOCACHE;
  
  
  
  1. START WITH N
    - 시퀀스의 시작값을 지정함
      N 을 1 로 지정하면 1부터 순차적으로 증가
      
  2. INCREMENT BY N
    - 시퀀스의 증가값을 지정함
      1로 하면 1씩 증가하고, 2로하면 2씩 증가
      
  3. MAXVALUE N / NOMAXVALUE 
    - 최대값 지정/ 무한대로 지정
    
  4. MINVALUE N / NOMINVALUE  
    - 최소값 지정/ 무한소 지정
    
  5. CYCLE      / NOCYCLE
    - 최대값까지 증가하면 다시 최소값으로 시작하도록 지정
      기본값은 NOCYCLE
      
  6. CACHE      / NOCACHE;
    - 오라클에서 미리 지정해 놓은 메모리 값
      기본값은 2
*/

-- 시작값이 1이고 1씩 증가하고 최대값이 1000000이 되는 시퀀스 EMP_SEQ를 생성하시오


-- 시퀀스 생성
CREATE SEQUENCE EMP_SEQ
START WITH 10
INCREMENT BY 10
MAXVALUE 10000000;


SELECT * FROM EMP;
DROP SEQUENCE EMP_SEQ;

-- 비어있는 테이블 생성
CREATE TABLE EMP10 AS SELECT EMPNO, ENAME, HIREDATE FROM EMP WHERE 1=0;


DROP TABLE EMP10;
INSERT INTO EMP10 VALUES(1, 'JULIA', SYSDATE);

-- 데이터 추가
INSERT INTO EMP10 VALUES(EMP_SEQ.NEXTVAL, 'JULIA', SYSDATE);


SELECT * FROM EMP10;

-- 현재 값을 반환 : CURRVAL
SELECT EMP_SEQ.CURRVAL FROM DUAL;

-- 현재 시퀀스의 다음 값을 반환함 : NEXTVAL
SELECT EMP_SEQ.NEXTVAL FROM DUAL;


DELETE FROM EMP10;
ROLLBACK;

-- 시퀀스를 확인하는 명령
SELECT SEQUENCE_NAME, MIN_VALUE, MAX_VALUE, INCREMENT_BY, CYCLE_FLAG FROM USER_SEQUENCES;
SELECT EMP_SEQ.NEXTVAL FROM DUAL;

/*
  NEXTVAL, CURRVAL 을 사용할 수 있는 경우
    1. 서브쿼리가 아닌 SELECT문
    2. INSERT문의 SELECT절
    3. INSERT VALUES절에 사용
    4. UPDATE문의 SET절
  
  NEXTVAL, CURRVAL 을 사용할 수 없는 경우
    1. VIEW의 SELECT절
    2. DISTINCT 키워드가 있는 SELECT절
    3. GROUP BY, HAVING, ORDER BY절이 있는 SELECT절
    4. SELECT, DELETE, UPDATE의 서브쿼리
    5. CREATE TABLE, ALTER TABLE 명령
    
  시퀀스 값을 변경하려면 ALTER SEQUENCE
  
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
  뷰의 개념
    - 보다라는 의미를 갖고 있는 점을 감안해서 실제 테이블(물리테이블)에 저장된 데이터를 뷰를 통해서 볼 수 있다.
      뷰를 가상 테이블이라고 함(테이블과 거의 동일하게 사용되기 때문)  
    - 뷰는 물리적인 구조인 테이블과 달리 데이터 저장공간이 없다.
    - 뷰는 단지 쿼리문을 저장하고 있는 객체라고 표현할 수 있다.
    
  뷰의 사용목적
    - 직접적인 테이블 접근을 제한하기 위해 사용한다.
    - 복잡한 질의를 쉽게 만들기 위해서 사용한다.
    
  뷰의 특징
    - 뷰는 테이블에 대한 제한을 가지고 테이블의 일정한 부분만 보일 수 있는 가상의 테이블
    - 뷰는 실제 데이터를 가지고 있지 않지만, 뷰를 통해서 테이블을 관리할 수 있다.
    - 하나의 테이블에 뷰의 개수는 제한이 없다.
    
  뷰는 CREATE문을 이용하여 생성
  
  기본 테이블
    - 뷰에 의해 제한적으로 접근해서 사용하는 실질적으로 데이터를 저장하고 있는 물리적인 테이블을 의미
*/

SELECT * FROM EMP01;
DROP TABLE EMP01;
CREATE TABLE EMP01
AS SELECT * FROM EMP;

SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01 WHERE DEPTNO=10;

/*
  뷰의 생성
    - 뷰는 테이블처럼 하나의 개체로서 테이블을 생성할 때와 유사하게 CREATE VIEW 명령으로 생성한다.
    
    CREATE [OR REPLACE][FORCE | NO FORCE] VIEW VIEW_NAME
    AS SUBQUERY
    [WITH CHECK OPTION]
    [WITH READ ONLY];
    
    
    OR REPLACE : 새로운 뷰를 만들 수 있을 뿐만 아니라 기존에 뷰가 존재하더라도 삭제하지 않고 새로운 구조의 뷰로 변경할 수 있다.
    
    FORCE | NOFORCE : 기본 테이블의 존재여부에 상관없이 뷰를 생성한다.
    
    WITH CHECK OPTION : 해당 뷰를 통해서 볼 수 있는 범위 내에서만 UPDATE OR INSERT 명령이 가능하다.
    
    WITH READ ONLY : 해당 뷰를 통해서는 SELECT만 가능(INSERT/UPDATE/DELETE 명령어는 사용할 수 없다.)
    
    
  뷰의 동작 원리
    - 사용자가 뷰에 대해서 질의를 하면 USER_VIEWS에서 뷰에 대한 조회를 할 수 있다.
    - 기본 테이블에 대한 뷰의 접근 권한을 살핌
    - 뷰에 대한 질의를 기본 테이블에 대한 질의로 변환함
    - 기본 테이블에 대한 질의를 통해서 데이터를 검색함
    - 검색된 결과를 출력
    
    
  뷰의 종류
    - 기본 테이블의 수에 따라 단순뷰와 복합뷰로 나누어짐
    
          단순뷰                                    복합뷰
     하나의 테이블로 생성                     여러개의 테이블로 생성     
     그룹함수 사용불가                        그룹함수 사용가능
     DISTINCT 사용불가                        DISTINCT 사용가능
     DML(삽입, 수정, 삭제)사용가능             DML 사용불가 
*/

SELECT VIEW_NAME, TEXT FROM USER_VIEWS;

DROP VIEW VIEW_EMP10;
SELECT * FROM VIEW_EMP10;

CREATE VIEW VIEW_EMP10
AS SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01
WHERE DEPTNO=10;

INSERT INTO VIEW_EMP10 VALUES(8000, 'ANGEL', 7000, 10);
DELETE FROM VIEW_EMP10 WHERE EMPNO = 8000;
-- 단순뷰를 대상으로 실해한 DML 명령문의 처리 결과는 뷰를 정의할 때 사용한 기본 테이블에 영향을 미친다.

SELECT * FROM EMP01;
ROLLBACK;

DESC VIEW_EMP10;


--단순 뷰의 컬럼에 별칭 사용하기
CREATE OR REPLACE VIEW VIEW_EMP(사원번호, 사원명, 급여, 부서번호)
AS SELECT EMPNO, ENAME, SAL, DEPTNO FROM EMP01;

SELECT * FROM VIEW_EMP;



-- 그룹함수를 사용한 단순뷰
-- 부서별 급여 총액과 평균을 구하는 작업을 뷰로 생성해놓고 사용하기 위함
CREATE VIEW VIEW_SAL 
AS SELECT DEPTNO, SUM(SAL) "SalSum", avg(sal) "SalAvg" from emp01
GROUP BY DEPTNO;

SELECT * FROM VIEW_SAL;


-- 복합 뷰 : 두 개 이상의 기본 테이블에 의해 정의한 뷰
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
-- 뷰 생성시 조건으로 지정한 컬럼 값을 변경하지 못하도록 하는 것을 의미함
CREATE OR REPLACE VIEW VIEW_CHK20
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP01 WHERE DEPTNO=20 WITH CHECK OPTION;


SELECT * FROM VIEW_CHK20;

-- 급여가 5000이상인 사원을 10번 부서로 이동하는 쿼리문을 작성하시오.
UPDATE VIEW_CHK20 SET DEPTNO=10 WHERE SAL>=5000;

SELECT * FROM VIEW_CHK20;


-- WITH READ ONLY
-- 뷰를 통해서는 기본테이블의 어떤 컬럼에 대해서도 내용을 절대 변경할 수 없도록 하는 것을 의미함
CREATE OR REPLACE VIEW VIEW_READ30
AS SELECT EMPNO, ENAME, SAL, COMM, DEPTNO FROM EMP01 WHERE DEPTNO=30 WITH READ ONLY;

SELECT * FROM VIEW_READ30;
UPDATE VIEW_READ30 SET COMM=1000;


/*
  WITH CHECK OPTION
    - 조건에 사용한 컬럼의 값을 수정하지 못하게 함
    
  WITH READ ONLY
    - 기본 테이블의 모두를 수정하지 못하게 하는 것
*/