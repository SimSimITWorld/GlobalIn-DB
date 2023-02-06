/*
  LIKE 연산자
    - 검색하고자 하는 값을 정확히 모를 경우 와일드 카드와 함께 사용하여 원하는
      내용을 검색하는 연산자
      
      컬럼이름 LIKE 패턴
      와일드 카드 종류
        % : 문자가 없거나, 하나 이상의 문자가 어떤 값이 오든 상관없을 경우
            0 ~ n개의 문자열을 대체함
            
        _ : 하나의 문자가 어떤 값이 오든지 상관없음
            단 한글자의 문자열을 대체함
*/

-- %는 검색하고자 하는 값을 정확히 모를 경우, %는 몇개의 문자가 오든 상관이 없다.
-- k로 시작하는 사원을 검색하시오.
select empno, ename from emp where ename like 'K%';  
-- k를 포함하는 사원을 검색하시오.
select empno, ename from emp where ename like '%K%'; 
-- k로 끝나는 사원을 검색하시오.
select empno, ename from emp where ename like '%K';  
select empno, ename from emp;

-- 사용자 계정확인
show user;

-- _는 한 문자를 대신해서 사용하는 것
-- 문] 이름의 두번째 글자가 A인 사원을 검색하시오.
select empno, ename from emp where ename like '_A%';
select empno, ename from emp where ename like '__N%';

select empno, ename from emp where ename not like '%A%';

select * from emp;
select ename, comm, job from emp where comm is not null;
/*
  NULL 연산자
    오라클에서는 컬럼에 NULL값이 저장되는 것을 허용한다.
    NULL은 미확정, 알 수 없는 값을 의미하며, 0도 빈공간도 아닌 어떤 값이 존재하지만,
           알아 낼 수 없는 값을 의미한다.
    NULL은 연산, 할당, 비교가 불가능하다.
    
    
  NULL 이 저장되어 있는 경우에는 비교연산자(=)로는 판단할 수 없음
  
  is null과 is not null
  
  is null     : 값이 null이면 만족
  is not null : 값이 null이 아니면 만족
*/

-- 문] 자신의 직속상관이 없는 사원의 이름, 직급, 직속상관의 사번을 출력하시오.
-- select ename, mgr from emp where ; 식을 완성시키시오. 
select ename, job CEO, mgr from emp where mgr is null;



/*
  정렬을 위한 order by 절
  order by 절은 로우(행)를 정렬하는데 사용하며 쿼리문 맨 뒤에 기술한다.
  정렬의 기준이 되는 컬럼 이름 또는 select 절에서 명시된 별칭을 사용할 수 있다.
  
              오름차순(ASC)             내림차순(DESC)
  숫자         작은 값부터                큰 값부터
  문자         사전 순으로              사전 반대 순서
  날짜         빠른 날짜순              늦은 날짜 순서
  NULL      가장 마지막에 나옴          가장 먼저 나옴
  
  ***** 영문자의 경우 소문자를 가장 큰 값으로 하고, null 값은 모든 값 중 가장 작은 값으로 인식함
*/
select * from emp;
-- 사번을 기준으로 오름차순 하시오
select empno, ename from emp order by empno DESC;

-- 문] 사원의 사번, 이름, 급여를 급여가 높은 순으로 출력하시오.
select ename, empno, sal from emp order by sal DESC;

-- 문] 입사일이 가장 최근인 사원 순으로 출력하되, 사번, 이름, 입사일을 출력하시오.
select empno, ename, hiredate from emp order by hiredate DESC;

-- 문] 급여가 같은 사람이 존재할 경우 이름을 철자의 순서가 빠른 사람을 기준으로 출력하시오
select empno, ename, sal from emp order by sal desc, ename ASC;

/*
  dual 테이블
    - 오라클에서 1일이 몇 초인지 환산하고자 한다.
      1일이 24시간이고 1시간은 60분이며 1분은 60초이므로 24*60*60 하면
      하루가 몇초인지 계산됨, 이런 결과를 얻으려면
      위의 산술식을 오라클 프롬프트에 바로 입력하면 오류가 발생함
      왜냐하면 24*60*60은 sql문의 종류에 속하지 않은 명령이기 때문이다. 
      
      dual 테이블은 산술연산이나 가상컬럼 등의 값을 한번만 출력하고 싶을 때 사용하는 아주 
      유용한 테이블로서 DUMMY 라는 한개의 컬럼으로 구성된 테이블이다.
      DUMMY 컬럼에는 한개의 문자만 저장할 수 있고 단 하나의 행만 저장한다.
*/

select 20*2 from dual;
desc dual;
select 24*60*60 from dual;
select * from dual;

select deptno, sal from emp where deptno=30 order by sal desc;

select deptno, sal from emp where deptno=30;

select deptno, sum(sal) from emp group by deptno having deptno=30;

/*
  단일행 함수 : 행마다 함수가 적용되어 결과를 반환함
    - 문자함수 : 문자열을 다른 형태로 변환하여 나타냄
    - 숫자함수 : 숫자의 값을 다른 형태로 변환하여 나타냄
    - 날짜함수 : 날짜의 값을 다른 형태로 변환하여 나타냄
    - 변환함수 : 문자, 숫자, 날짜 값을 서로 다른 타입으로 변환하여 나타냄
    - 일반함수 : 기타함수
  
  그룹 함수 : 하나 이상의 행을 그룹으로 묶어 연산하여 결과를 리턴한다.
    - sum : 그룹의 누적 합계를 반환함 
    - avg : 그룹의 평균을 반환함
    - count : 그룹의 총 개수를 반환함
    - max : 그룹의 최대값을 반환함 
    - min : 그룹의 최소값을 반환함
    - stddev : 그룹의 표준편차를 반환함
    - variance : 그룹의 분산을 반환함
*/

/*
  문자함수 : 문자열을 다른 형태로 변환하여 나타냄
             문자형의 값을 조작하여 변환된 문자 값을 반환함
             
  - LOWER : 소문자로 변환
  - UPPER : 대문자로 변환
  - INITCAP : 첫글자만 대문자로 변환 나머지는 소문자로 변환
  - CONCAT : 문자의 값을 연결
  - SUBSTR  : 문자를 잘라서 추출함(한글 1byte)
  - SUBSTRB : 문자를 잘라서 추출함(한글 2byte)
  - LENGTH : 문자의 길이를 반환(1byte)
  - LENGTHB : 문자의 길이를 반환(2byte) 
  - INSTR  : 특정 문자의 위치 값을 반환(한글 1byte)
  - INSTRB : 특정 문자의 위치 값을 반환(한글 2byte)
  - LPAD,RPAD : 입력받은 문자열과 기호를 정렬하여 특정 길이의 문자열로 반환
  - TRIM : 공백을 잘라내고 남은 문자를 표시
  - CONVERT : char set 변환
  - CHR : ASCII 코드 값으로 변환
  - ASCII : ASCII 코드 값을 문자로 변환
  - REPLACE : 문자열에서 특정 문자를 변경
*/
select empno, ename from emp;
select empno, lower(ename) from emp;

select substr('DataBase', 1, 3) from dual;
select substr(hiredate, 3, 4)  from emp;

select empno, initcap(ename) from emp;

select concat('Data', 'Base') from dual;

select LPAD(ename, 20, '$') from emp;
select TRIM('a' from 'aaaaaDataaaaaaa') from dual;
select initcap(ename) from emp where length(ename)=4;
select substr('DataBase', 5, 4) from dual;
select substr('DataBase', -4, 4) from dual;

select substr('데이터베이스', 3, 4) from dual; -- 바이트 수 기준
select substrb('데이터베이스', 0, 3) from dual; -- 글자 수 기준

