
/*

  숫자함수 : 숫자 값을 다른 형태로 변환하여 나타냄
            숫자 데이터를 조작하여 변환된 숫자 값을 반환하는 함수
            
                                           * 표시 : 자주 쓰는 함수
  구분      설명
  ----------------------------------------------------------------
  ABS       절대값을 반환
  COS       cosine 값을 반환
  EXP       e 의 n 승을 반환
  FLOOR     소수점 아래를 잘라버림  *
  LOG       log값을 반환
  POWER     power(m, n)형식으로 m의 n승을 반환함
  SIGN      sign(n) n < 0이면 -1, n=0, n > 0이면 1을 반환
  SIN       sine값을 반환
  TAN       tangent값을 반환
  ROUND     특정 자릿수에서 반올림  *
  TRUNC     특정 자릿수에서 잘라냄  *
  MOD       입력받은 수를 나눈 나머지 값을 반환  *

*/

select abs(-15) from dual;
select floor(34.5678) from dual;

select round(12345.4678),
round(1234.5678, 0), -- 소수점 첫째 자리에서 반올림
round(1234.5678, 1),
round(1234.5678, 2),
round(1234.5678, -1),
round(1234.5678, -2)
from dual;

select mod(34, 7) from dual;

/*
  날짜함수 : 날짜 값을 다른 형태로 변환하여 나타냄
            Data(날짜)형에 사용하는 함수이며 결과값으로 또는 기간을 얻는다.
            기간은 주로 일 단위로 계산되지만 월 단위로 계산되는 경우도 있다.
            
  SYSDATE           : 시스템에 저장된 현재 날짜를 반환
  MONTHS_BETWEEN    : 두 날짜 사이가 몇 개월 차이가 나는지를 반환
  ADD_MONTH         : 특정한 날짜의 개월 수를 더할 때
  NEXT_DAY          : 특정한 날짜의 최초로 도래하는 인자로 받은 요일의 날짜를 반환
  LAST_DAY          : 해당 월의 마지막 날짜를 반환
  ROUND             : 인자로 받은 날짜를 기준으로 반올림한다.
  TRUNC             : 인자로 받은 날짜를 기준으로 버림
*/

select sysdate from dual;
select substr(sysdate, -2,2) from dual;
select sysdate-1 어제, sysdate 오늘, sysdate+1 내일 from dual;
select last_day(sysdate) from dual;


  
select * from emp;
select ename,deptno,hiredate,round(sysdate-hiredate) 근무일수 from emp where deptno=10 ;

select ename,deptno,sysdate,hiredate, round(months_between(sysdate, hiredate)) from emp where deptno=10;

select ename,deptno,round(add_months(sysdate, 3)) "3개월 후" from emp where deptno=10;

-- next_day : 해당 요일의 가장 가까운 날짜를 반환하는 함수
-- next_day(date, 요일)

alter session set nls_language=korean;
select sysdate, next_day(sysdate, '수요일') from dual;


/*
  변환함수 : 문자, 날짜, 숫자 값을 서로 다른 타입으로 변환하여 나타냄
            자료형을 변환시키고자 할 때 사용하는 함수
            
  TO_CHAR   : 날짜형 혹은 숫자형을 문자형으로 변환
  TO_DATE   : 문자형을 날짜형으로 변환
  TO_NUMBER : 문자형을 숫자형으로 변환

  TO_CHAR(날짜 데이터, '출력형식')
  
  YYYY  : 년도 4자리
  YY    : 년도 2자리
  MM    : 월을 숫자로
  MON   : 월을 알파벳으로
  DD    : 일 표시
  DAY   : 요일 표시
  DY    : 요일을 약어로 표시
*/
select sysdate,to_char(sysdate, 'YYYY-MON-DD DY, HH:MI:SS') from dual;
select * from emp;
select ename,hiredate from emp where hiredate=to_date(19810220, 'YYYYMMDD');
select sysdate-to_date('2022/01/01') from dual;
select trunc(sysdate-to_date('2022/01/01')) from dual;

/*
  TO_NUMBER : 문자형을 숫자형으로 변환
     - 숫자형으로 변환하는 함수
*/
select to_number('10,000','999,999')+to_number('20,000','999,999') from dual;


/*
  NVL       : 첫번째 인자로 받은 값이 NULL과 같으면 두번째 인자 값으로 변경
  DECODE    : 첫번째 인자로 받은 값을 조건에 맞춰서 변경(IF와 유사)
  CASE      : 조건에 맞는 문장을 수행(SWITCH ~ CASE문과 유사)
*/

-- NVL : NULL을 다른 값으로 변환하는 함수
--       NULL을 0 또는 다른 값으로 변환하기 위한 함수

select ename, sal, comm, job from emp order by job;
select ename, sal, NVL(comm, 0), job from emp order by job;
select ename, sal, comm, sal*12+NVL(comm, 0), job from emp order by job;

/*
  DECODE : 첫번째 인자로 받은 값을 조건에 맞춰서 변경(IF와 유사)
  DECODE(표현식, 조건1, 결과1,
                 조건2, 결과2,
                 조건3, 결과3,
                 기본결과 N)
*/
select * from dept;
select deptno from emp;
select deptno, decode(deptno, 10, 'ACCOUNTING',
                              20, 'RESEARCH',
                              30, 'SALES',
                              40, 'OPERATIONS') as "부서이름"
from emp;


/*
  CASE 함수  
  조건에 따라 서로 다른 처리가 가능하다.
    CASE 표현식 WHEN 조건1 THEN 결과1
                WHEN 조건2 THEN 결과2
                WHEN 조건3 THEN 결과3
                ELSE 결과 N
  END
*/

           select deptno,  case when deptno=10 THEN 'ACCOUNTING'
                            when deptno=20 THEN 'RESEARCH'
                            when deptno=30 THEN 'SALES'
                            when deptno=40 THEN 'OPERATIONS'
                            ELSE '쉬는시간입니다.'
                            END
                            AS "부서명"
from emp;

/*
  문]
     직급에 따라 급여를 인상하도록 하자.(사원번호, 사원명, 직급, 급여)
     직급이 'ANALYST' 인 사원은 5%,
            'SALESMAN' 인 사원은 10%,
            'MANNAGER' 인 사원은 15%,
            'CLERK' 인 사원은 20% 인상한다.
*/
select * from emp;
select empno 사원번호, ename 사원명, job 직급 ,sal 급여,
case when job = 'ANALYST' then sal*1.05 
     when job = 'SALESMAN' then sal*1.1
     when job = 'MANAGER' then sal*1.15
     when job = 'CLERK' then sal*1.2
     else sal
     end 수당 from emp order by sal;



select avg(sal) from emp;
select distinct(deptno) from emp;
select deptno, sum(sal), trunc(avg(sal)) from emp group by deptno;
select deptno, MAX(sal), MIN(sal) from emp group by deptno;


-- 부서별로 사원의 수와 커미션을 받는 사원의 수를 카운트 하시오.
select deptno,count(*),count(comm) from emp group by deptno;
select deptno, MAX(sal), MIN(sal), trunc(avg(sal)) from emp group by deptno having avg(sal)>=2000;
select deptno, MAX(sal), MIN(sal) from emp group by deptno having avg(sal)>2900;








