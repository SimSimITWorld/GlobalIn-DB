SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME='DEPT01';
SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME='EMP01';

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT01', 'EMP01');

SELECT * FROM EMP01;
SELECT * FROM DEPT01;

-- DEPT01 테이블의 기본키를 비활성화 한다. (불가능)
ALTER TABLE DEPT01
DISABLE PRIMARY KEY;  -- 불가능
-- DEPT01 테이블의 기본키는 EMP01 테이블의 외래키에서 참조하고 있기 때문에
-- 제약조건을 비활성화 할 수 없다.
ALTER TABLE EMP01
ENABLE PRIMARY KEY;




-- 부모테이블과 자식테이블을 동시에 비활성화
ALTER TABLE DEPT01
DISABLE PRIMARY KEY CASCADE;

ROLLBACK;

-- 부모테이블과 자식테이블을 동시에 활성화는 불가능(따로따로 활성화 시켜줘야함)
ALTER TABLE EMP01
ENABLE PRIMARY KEY;

SELECT CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME, STATUS FROM USER_CONSTRAINTS WHERE TABLE_NAME IN('DEPT01', 'EMP01');

ALTER TABLE DEPT01
DROP PRIMARY KEY CASCADE; -- 아예 제거 할 때 사용

ROLLBACK;



/*
  조인
    - 한 개 이상의 테이블에서 원하는 결과를 얻기 위한 방법
    
      Equi Join     : 동일한 컬럼을 기준으로 조인함
      Non Equi Join : 동일한 컬럼 없이 다른 조건을 사용하여 조인(두 테이블간 공통된 컬럼이 없을 때 사용)
      Outer Join    : 조인 조건에 만족하지 않는 행도 나타남(결과값)
      Self Join     : 한 테이블 내에서 조인함
      
      emp a, emp b
*/

-- Equi Join
SELECT ENAME, DNAME FROM EMP01, DEPT01 WHERE EMP01.DEPTNO=DEPT01.DEPTNO;




-- Non Equi Join은 조인할 테이블 사이에 컬럼의 값이 직접적으로 일치하지 않을 시
-- 사용하는 조인으로 '='을 제외한 연산자를 사용한다.
SELECT * FROM salgrade; 
SELECT * FROM EMP01;

SELECT E.ENAME 이름, E.SAL 급여, S.GRADE 등급 FROM EMP E, SALGRADE S WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL;



-- Outer Join : 행이 조인 조건에 만족하지 않을 경우 그 행은 결과에
--              나타나지 않게 됨, 이 때 조인 조건에 만족하지 않는 
--              행들도 나타나게 함

SELECT * FROM DEPT01;
SELECT * FROM EMP;

SELECT E.ENAME, D.DEPTNO, D.DNAME
FROM EMP E, DEPT01 D 
WHERE E.DEPTNO(+)=D.DEPTNO;



-- 특정 사원을 담당하는 매니저 사원의 이름을 출력
SELECT ENAME, MGR FROM EMP;
SELECT WORK.ENAME 사원, MANAGER.ENAME 매니저
FROM EMP WORK, EMP MANAGER
WHERE WORK.MGR=MANAGER.EMPNO;


/*
  서브쿼리
    서브쿼리는 하나의 SELECT 문장의 절 안에 포함된 또 하나의 SELECT 문을 의미한다.
      -메인(주), 서브(부)
*/

-- SCOTT의 부서명을 알아보려고 한다
SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT';

-- 부서번호가 20번이면 부서이름을 알아낼 수 있음
SELECT DNAME FROM DEPT;

SELECT DNAME FROM DEPT WHERE DEPTNO=20;

SELECT DNAME FROM DEPT WHERE DEPTNO=(SELECT DEPTNO FROM EMP WHERE ENAME='SCOTT');
--            메인쿼리               (                서브쿼리                  );

/*
  단일행 서브쿼리 : 내부 SELECT 문장으로부터 오직 하나의 행만을 반환한다.
                   사용연산자 : 비교연산자 ( >, <, >=, <=, =, !=, <> )
                   
  다중행 서브쿼리 : 서브쿼리에서 반환되는 결과가 하나 이상의 행일때를 의미함
                   사용연산자 : IN, (ANY, SOME), ALL, EXIST
*/

/*
  IN 연산자 : 둘 중 하나 (OR문)
  
    - 급여를 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원을 출력하시오.
*/
SELECT DISTINCT DEPTNO FROM EMP WHERE SAL>=3000;
SELECT ENAME, SAL, DEPTNO FROM EMP;

SELECT ENAME, SAL, DEPTNO FROM EMP WHERE DEPTNO IN(SELECT DISTINCT DEPTNO FROM EMP WHERE SAL>=3000);


/*
  ALL 연산자 : 메인쿼리의 비교조건이 서브쿼리의 검색결과와 모든 값이 일치하면 참
    
    - 30번 소속 사원들 중에서 급여를 가장 많이 받는 사원보다 더 많은 급여를 받는 사원의 이름과 급여를 출력
*/
SELECT * FROM EMP;
SELECT ENAME, SAL FROM EMP WHERE SAL>=2850;
SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30;

SELECT ENAME, SAL FROM EMP WHERE SAL > ALL(SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

/*
  ANY 연산자 : 메인 쿼리의 비교 조건이 서브 쿼리의 검색 결과와 하나 이상만 일치하면 참
               즉, 찾아진 값에서 가장 작은 값(최소값)보다 크면 참이 된다.
               
    - 부서번호가 30번인 사원들의 급여 중 가장 작은 값 보다 많은 급여를 받는 사원의 이름과 급여를 출력하시오.
*/
SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30; -- 서브쿼리
SELECT ENAME, SAL FROM EMP;
SELECT ENAME, SAL FROM EMP WHERE SAL>ANY(SELECT MIN(SAL) FROM EMP WHERE DEPTNO=30);

-- 테이블 구조 및 내부정보 모두 복사
CREATE TABLE EMP08 AS SELECT * FROM EMP;

DROP TABLE EMP08;
DESC EMP;
SELECT * FROM EMP08;
SELECT * FROM TAB;
PURGE RECYCLEBIN;

-- 테이블 구조만 복사
-- 1=0 : 거짓
CREATE TABLE EMP08 AS SELECT * FROM EMP WHERE 1=0;


CREATE TABLE DEPT02 AS SELECT * FROM DEPT WHERE 1=0;
DROP TABLE DEPT02;
SELECT * FROM DEPT02;
SELECT * FROM DEPT;

-- 서브쿼리에서는 복사할 때 VALUES를 사용하지 않음
INSERT INTO DEPT02 SELECT * FROM DEPT;

SELECT * FROM  DEPT02;

/*
  10번 부서의 지역명을 40번 부서의 지역명으로 변경하시오
  NEW YORK --> BOSTON
*/
UPDATE DEPT02 SET LOC=(SELECT LOC FROM DEPT02 WHERE DEPTNO=40) WHERE DEPTNO=10;
ROLLBACK;


/*
20번 부서명과 지역명을 30번 부서의 부서명과 지역명으로 변경하시오.
*/
UPDATE DEPT02 SET (DNAME, LOC)=(SELECT DNAME, LOC FROM DEPT02 WHERE DEPTNO=30) WHERE DEPTNO=20;

CREATE TABLE EMP09 AS SELECT * FROM EMP;

SELECT * FROM EMP09;
SELECT DEPTNO, DNAME FROM DEPT01;

-- 부서 번호를 검색 : 30
SELECT DEPTNO FROM DEPT01 WHERE DNAME='SALES';

DELETE FROM EMP09 WHERE DEPTNO=(SELECT DEPTNO FROM DEPT01 WHERE DNAME='SALES');


SELECT * FROM DEPT01;
DELETE FROM DEPT01 WHERE DEPTNO=20;
COMMIT;
ROLLBACK;
-- COMMIT 후에는 ROLLBACK 을 해도 소용이 없다.



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
START WITH 1
INCREMENT BY 1
MAXVALUE 1000000;


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
*/