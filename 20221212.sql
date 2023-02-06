/*
   select
      - 데이터베이스로부터 정보를 검색할 수 있는 명령어이다.
      - 조건을 부여해서 특정한 로우(행)만 조회한다.
      - 특정 컬럼(열)을 기준으로 내림차순 또는 오름차순으로 정렬한다.
      
   형식
      select 
      * : 모든 컬럼을 의미함
      컬럼명, 컬럼명,... 
      from 테이블명
*/

select 
deptno,
loc from 
dept WHERE deptno=10 or deptno=20;

select * from tab;
-- emp 테이블의 모든 내용을 출력하시오

select * from emp;
select * from dept;

desc dept;

-- dept 테이블에서 부서번호와 부서명만 출력
-- 컬럼의 이름을 명시해서 특정 컬럼만 조회하기
select deptno, dname from dept;


-- 사원테이블에서 이름과, 급여와, 입사일을 출력하시오
select * from tab;
select * from emp;

select ename, sal, hiredate from emp;

-- 컬럼 이름에 별칭 지정하기
select deptno as "DepartmentNo" from dept;
select deptno from dept;

/*
  컬럼을 기술한 바로 뒤에 as 라는 키워드를 쓴 후 별칭을 기술한다. 
  별칭에 공백문자나 $, _, # 등 특수문자를 표현하고 싶거나 대소문자를 구별하고 싶으면
  " "를 사용하면 된다.
  as를 생략하고 " "만 사용하여도 별칭 사용 가능 
*/
select deptno "$$$$$" from dept;
select deptno as 부서번호 from dept;
 
 
select deptno 부서번호, dname 부서명 from dept;
 
 
select * from emp;
 
select distinct job from emp; 
 
select distinct deptno from emp;
 
 
 -- =, >, <, >=, <=, (!=, ^=, <>) <-- 이 3개는 다르다는 것을 의미
 

 -- 급여가 3000이상 받는 사원을 출력하되, 사원번호, 사원이름, 급여를 출력하시오.
 
select empno, ename, sal from emp where sal>=3000;

 -- 급여가 3000미만 받는 사원을 출력하되, 사원번호, 사원이름, 급여를 출력하시오.

select empno, ename, sal from emp where sal<3000;
 
select * from emp where deptno=10;

 -- 급여가 2000미만 받는 사원을 출력하되, 사원번호, 사원이름, 급여를 출력하시오.

select empno, ename, sal from emp where sal<2000;

/*
  문자 데이터 조회
    - 문자데이터는 반드시 단일따옴표(싱글쿼터) 안에 표시한다.
      대소문자를 구분한다.
*/

select empno, ename, sal from emp where ename = 'SCOTT';

-- 이름이 MILLER인 사람의 사원번호와 사원이름과 직급을 출력하시오.
select empno, ename, job from emp where ename = 'MILLER';

/*
  날짜 데이터 조회
    - 반드시 달일 따옴표 안에 표시함
      형식 : 년/월/일
      1985년 이후에 입사한 사원들을 이름과 입사일을 출력하시오.
*/

select * from emp;

select ename, hiredate from emp where hiredate>='1985/01/01';

/*
  AND 연산자
    - 여러 조건을 모두 만족해야할 경우 사용하는 연산자
    
    문] 부서번호가 10번이고 직급이 MANAGER인 사원의 이름, 부서번호, 직급을 출력하시오.
*/
select ename, deptno, job from emp where deptno=10 and job='MANAGER';
-- 급여가 1000에서 3000사이에 있는 사원의 모든 정보를 출력하시오.
select * from emp where sal>=1000 and sal<=3000;

/*
  OR 연산자
    - 두가지 조건 중 하나만 만족하더라도 검색이 가능하다.
    
    문1] 부서번호가 10번이거나 직급이 MANAGER인 사원의 이름, 부서번호, 직급을 출력하시오.
*/
select ename,deptno,job from emp where deptno=10 or job = 'MANAGER';

-- 문2] 사원번호가 7844이거나 7654이거나 7521인 사원의 모든 정보를 출력하시오.
select * from emp where empno=7844 or empno=7654 or empno=7521;

-- not 연산자 : 반대되는 연산자  
-- 문3] 부서번호가 10이 아닌 사원의 모든 정보를 출력하시오.`
select * from emp where not deptno=10;

select * from emp where not job='MANAGER';

/*
  BETWEEN AND 연산자
    - 특정 범위 내에 속하는 데이터를 검색할 때 사용하는 연산자
      컬럼명 BETWEEN A AND B
      
   문1] 급여가 1000에서 3000사이의 있는 사원정보를 출력하시오.    
*/
select * from emp where sal>=1000 and sal<=3000;
select * from emp where sal between 1000 and 3000;

-- 문2] 급여가 1500과 2500 사이인 사원의 사원번호, 사원이름, 급여를 출력하시오.
--      단, and 연산자와 between and 연산자를 사용하여 출력하시오.
select empno, ename, sal from emp where sal>=1500 and sal<=2500;
select empno, ename, sal from emp where sal between 1500 and 2500;

-- 사원번호가 7844이거나 7654이거나 7521인 사원의 모든 정보를 출력하시오.
select * from emp where empno=7844 or empno=7654 or empno=7521;

-- in 연산자
--   - 동일한 컬럼이 여러개의 값 중에서 하나인지를 알아보려고 할 때 사용하는 연산자
select * from emp where empno in(7844, 7654, 7521); 

-- 커미션이 300이거나 500이거나, 1400 중 하나인 사원의 이름, 급여, 커미션을 출력하시오.
select ename, sal, comm from emp where comm=300 or comm=500 or comm=1400;
select ename, sal, comm from emp where comm in(300, 500, 1400);

