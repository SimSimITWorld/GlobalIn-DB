/*
  컬럼을 정의 할 때 지정할 수 있는 자료형
  
                                    * 주로 n은 size를 표현할 때 사용함 n = size;
  
  - char(n)     : 고정길이 문자 데이터, 최소 크기는 1byte, 최대 크기는 2000byte   
  - varchar(n)  : 가변길이 문자 데이터, 최소 크기는 1byte, 최대 크기는 4000byte
  - number      : 숫자를 저장하는 데이터, 최소 크기는 1byte, 최대 크기는 40 자리
  - number(n)   : 지정한 n 값까지의 크기     
  - number(n, d): 지정한 n 크기에서 소수점을 지정함(d)
  - date        : 날짜를 저장하는 데이터
  - long        : 가변길이 문자 데이터 최대크기는 2gbyte(기가바이트)
  - rowid       : DB(database)에 저장되어 있지 않으며 DB의 데이터도 아니다.
  
*/
select * from emp; -- EMPNO 옆에 있는 행 값(1 ~ 14)이 rowid 이다. 
desc emp;

/*
  테이블명과 컬럼명을 지정하기 위한 규칙
    1. 반드시 문자로 시작해야함
    2. 1 ~ 30 자까지 가능
    3. A ~ Z 까지의 대소문자, 0 ~ 9 까지의 숫자, (_ , # , $) 특수문자만 가능
    4. 예약어는 사용불가
    5. 공백을 허용안함
*/

-- 사원번호, 사원명, 급여 3개의 컬럼으로 구성된 emp01 테이블을 작성하시오.
create table emp01 ( 
-- 필드 정의
-- 컬럼 지정
empno number,
ename varchar(10),
sal number(7,2)
);

select * from tab;

desc emp01;

select * from emp02;

desc emp02;

-- 테이블 복사
create table emp02
as select * from emp;

drop table emp02; -- 휴지통에 버리기
purge table emp02; -- 휴지통 비우기
select * from tab;

/*
  alter table 테이블 구조 변경
  alter table 명령어는 테이블에서 컬럼을 추가, 삭제, 타입이나 길이를 변경할 때 사용함
  
  add column    : 새로운 컬럼 추가
  modify column : 기존 컬럼 수정
  drop column   : 컬럼 삭제
  
  형식
    alter table 테이블명
    add(컬럼명 데이터타입);
    
  해당 컬럼에 데이터가 없을 경우
    - 기존 컬럼 수정
    - 데이터 타입이나 크기만 수정
  해당 컬럼에 데이터가 있을 경우
    - 컬럼 데이터 타입은 변경 불가
    - 크기를 늘릴 수 있지만 현재 가지고 있는 데이터 크기보다 작게는 변경불가
    
    alter table 테이블명
    modify(컬럼명 데이터 타입);
    
*/
alter table emp01
add(job varchar(9));
desc emp01;

select job, ename from emp01;

-- 컬럼 수정
desc emp01;
select * from emp01;
alter table emp01
modify(job varchar2(30));

-- 컬럼 삭제
alter table emp01
drop column job;

/*
테이블 삭제
drop table 테이블명
*/

select * from tab;

-- 휴지통으로 저장되지 않고 바로 삭제
drop table emp01 purge;

-- 휴지통에 있는 테이블 지정해서 지우기
purge table emp01;

-- 휴지통 비우기
purge recyclebin;

-- 휴지통에 있는 테이블 복원
flashback table emp01 to before drop;

desc emp;
desc dept;

select CONSTRAINT_NAME, CONSTRAINT_TYPE, TABLE_NAME, R_CONSTRAINT_NAME from USER_CONSTRAINTS where TABLE_NAME = 'EMP';
select * from user_constraints where TABLE_NAME = 'DEPT';

rename emp02 to emp03;

select * from emp04;
create table emp04 as select * from emp03;
truncate table emp04;
delete from emp03;
rollback := emp03;



/*
  테이블에 내용을 추가, 수정, 삭제 (DML)
  insert into, update set, delete from
  select
  
  insert(추가)
    - 특정한 컬럼에 데이터 추가
      insert into 테이블명(컬럼1, 컬럼2...) values(값1, 값2...);
    - 모든 컬럼에 데이터 추가
      insert into 테이블명 values(값1, 값2...);
*/

create table dept01(
deptno number(2),
dname varchar(14),
loc varchar(13)
);
select * from dept;
select * from dept01;

insert into dept01(deptno, dname, loc) values(10, 'ACCOUNTING', 'NEW YORK');
insert into dept01 values(20, 'RESEARCH', 'DALLAS');
desc dept01;
desc dept;
insert into dept01(deptno, dname, loc) values(30, 'SALES' , 'CHICAGO');


/*
  테이블의 내용을 수정
  update 테이블명
  set 컬럼명1=값1, 컬럼명2=값2
  where 조건

  update문은 기존의 행을 수정하는 것
             어떤 데이터를 수정하는지 where절을 이용하여 조건을 지정함
             where절을 생략시에는 모든행이 수정됨
*/
drop table emp01;
create table emp01
as select * from emp;
select * from emp01;
update emp01 set deptno=30;
rollback;

-- 모든 사원의 급여를 10% 인상하시오.
update emp01 set sal=sal*1.1;
select * from emp01;
update emp01 set hiredate=sysdate;
rollback;
update emp01 set deptno=30 where deptno = 10;

-- 급여가 3000 이상인 사원만 급여를 10% 인상
update emp01 set sal=sal*1.1 where sal>=3000;

-- 87년도에 입사한 사원의 입사일을 오늘로 수정
update emp01 set hiredate=sysdate where substr(hiredate,1,2)='87';



select * from emp01;

-- 사원의 이름이 scott의 부서번호를 10번, 직급은 MANAGER로 변경하시오.
update emp01 set deptno=10, job='MANAGER' where ename = 'SCOTT';

-- 사원의 이름이 scott의 입사일을 오늘로, 급여 50, 커미션 4000로 변경하시오.
update emp01 set hiredate=sysdate, sal=50, comm=4000 where ename='SCOTT';




-- 테이블에 불필요한 행을 삭제하기 위한 delete
-- 형식
-- delete from 테이블명 where 조건;
drop table dept01;
create table dept01
as select * from dept;
select * from dept01;
rollback;

delete from dept01;
delete from dept01 where deptno=30;


/*
  다음 명세를 참조하여 Employee 테이블을 생성하시오
  사원번호  숫자(4) 4자리,
  사원이름  문자(10) 10자리,
  직급      문자(9),
  상관      숫자(4),
  입사일    날짜형
  급여      숫자(7,2)
  커미션    숫자(7,2)
  부서번호  숫자(2)
  
  데이터 추가
  7369 smith clerk      7836 80/12/17 800        20
  7499 allen salesman   7369 87/12/20 1600  300  30
  7839 king  president                5000
*/
create table Employee(
사원번호 number(4),
사원이름 varchar(10),
직급 varchar(10),
상관 number(4),
입사일 date,
급여 number(7,2),
커미션 number(7,2),
부서번호 number(2)
);
select * from Employee;
insert into Employee(사원번호, 사원이름, 직급, 상관, 입사일, 급여, 부서번호) values(7369, 'smith', 'clerk', 7836, to_date(19801217, 'YY/MM/DD'), 800, 20); 
insert into Employee values(7499, 'allen', 'salesman', 7369, to_date(19871220, 'YY/MM/DD'), 1600, 300, 30);
insert into Employee(사원번호, 사원이름, 직급, 급여) values(7839, 'king', 'president', 5000);
rollback;

show user;

create user orauser01 identified by user01;
