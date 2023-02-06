/*
  �÷��� ���� �� �� ������ �� �ִ� �ڷ���
  
                                    * �ַ� n�� size�� ǥ���� �� ����� n = size;
  
  - char(n)     : �������� ���� ������, �ּ� ũ��� 1byte, �ִ� ũ��� 2000byte   
  - varchar(n)  : �������� ���� ������, �ּ� ũ��� 1byte, �ִ� ũ��� 4000byte
  - number      : ���ڸ� �����ϴ� ������, �ּ� ũ��� 1byte, �ִ� ũ��� 40 �ڸ�
  - number(n)   : ������ n �������� ũ��     
  - number(n, d): ������ n ũ�⿡�� �Ҽ����� ������(d)
  - date        : ��¥�� �����ϴ� ������
  - long        : �������� ���� ������ �ִ�ũ��� 2gbyte(�Ⱑ����Ʈ)
  - rowid       : DB(database)�� ����Ǿ� ���� ������ DB�� �����͵� �ƴϴ�.
  
*/
select * from emp; -- EMPNO ���� �ִ� �� ��(1 ~ 14)�� rowid �̴�. 
desc emp;

/*
  ���̺��� �÷����� �����ϱ� ���� ��Ģ
    1. �ݵ�� ���ڷ� �����ؾ���
    2. 1 ~ 30 �ڱ��� ����
    3. A ~ Z ������ ��ҹ���, 0 ~ 9 ������ ����, (_ , # , $) Ư�����ڸ� ����
    4. ������ ���Ұ�
    5. ������ ������
*/

-- �����ȣ, �����, �޿� 3���� �÷����� ������ emp01 ���̺��� �ۼ��Ͻÿ�.
create table emp01 ( 
-- �ʵ� ����
-- �÷� ����
empno number,
ename varchar(10),
sal number(7,2)
);

select * from tab;

desc emp01;

select * from emp02;

desc emp02;

-- ���̺� ����
create table emp02
as select * from emp;

drop table emp02; -- �����뿡 ������
purge table emp02; -- ������ ����
select * from tab;

/*
  alter table ���̺� ���� ����
  alter table ��ɾ�� ���̺��� �÷��� �߰�, ����, Ÿ���̳� ���̸� ������ �� �����
  
  add column    : ���ο� �÷� �߰�
  modify column : ���� �÷� ����
  drop column   : �÷� ����
  
  ����
    alter table ���̺��
    add(�÷��� ������Ÿ��);
    
  �ش� �÷��� �����Ͱ� ���� ���
    - ���� �÷� ����
    - ������ Ÿ���̳� ũ�⸸ ����
  �ش� �÷��� �����Ͱ� ���� ���
    - �÷� ������ Ÿ���� ���� �Ұ�
    - ũ�⸦ �ø� �� ������ ���� ������ �ִ� ������ ũ�⺸�� �۰Դ� ����Ұ�
    
    alter table ���̺��
    modify(�÷��� ������ Ÿ��);
    
*/
alter table emp01
add(job varchar(9));
desc emp01;

select job, ename from emp01;

-- �÷� ����
desc emp01;
select * from emp01;
alter table emp01
modify(job varchar2(30));

-- �÷� ����
alter table emp01
drop column job;

/*
���̺� ����
drop table ���̺��
*/

select * from tab;

-- ���������� ������� �ʰ� �ٷ� ����
drop table emp01 purge;

-- �����뿡 �ִ� ���̺� �����ؼ� �����
purge table emp01;

-- ������ ����
purge recyclebin;

-- �����뿡 �ִ� ���̺� ����
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
  ���̺� ������ �߰�, ����, ���� (DML)
  insert into, update set, delete from
  select
  
  insert(�߰�)
    - Ư���� �÷��� ������ �߰�
      insert into ���̺��(�÷�1, �÷�2...) values(��1, ��2...);
    - ��� �÷��� ������ �߰�
      insert into ���̺�� values(��1, ��2...);
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
  ���̺��� ������ ����
  update ���̺��
  set �÷���1=��1, �÷���2=��2
  where ����

  update���� ������ ���� �����ϴ� ��
             � �����͸� �����ϴ��� where���� �̿��Ͽ� ������ ������
             where���� �����ÿ��� ������� ������
*/
drop table emp01;
create table emp01
as select * from emp;
select * from emp01;
update emp01 set deptno=30;
rollback;

-- ��� ����� �޿��� 10% �λ��Ͻÿ�.
update emp01 set sal=sal*1.1;
select * from emp01;
update emp01 set hiredate=sysdate;
rollback;
update emp01 set deptno=30 where deptno = 10;

-- �޿��� 3000 �̻��� ����� �޿��� 10% �λ�
update emp01 set sal=sal*1.1 where sal>=3000;

-- 87�⵵�� �Ի��� ����� �Ի����� ���÷� ����
update emp01 set hiredate=sysdate where substr(hiredate,1,2)='87';



select * from emp01;

-- ����� �̸��� scott�� �μ���ȣ�� 10��, ������ MANAGER�� �����Ͻÿ�.
update emp01 set deptno=10, job='MANAGER' where ename = 'SCOTT';

-- ����� �̸��� scott�� �Ի����� ���÷�, �޿� 50, Ŀ�̼� 4000�� �����Ͻÿ�.
update emp01 set hiredate=sysdate, sal=50, comm=4000 where ename='SCOTT';




-- ���̺� ���ʿ��� ���� �����ϱ� ���� delete
-- ����
-- delete from ���̺�� where ����;
drop table dept01;
create table dept01
as select * from dept;
select * from dept01;
rollback;

delete from dept01;
delete from dept01 where deptno=30;


/*
  ���� ���� �����Ͽ� Employee ���̺��� �����Ͻÿ�
  �����ȣ  ����(4) 4�ڸ�,
  ����̸�  ����(10) 10�ڸ�,
  ����      ����(9),
  ���      ����(4),
  �Ի���    ��¥��
  �޿�      ����(7,2)
  Ŀ�̼�    ����(7,2)
  �μ���ȣ  ����(2)
  
  ������ �߰�
  7369 smith clerk      7836 80/12/17 800        20
  7499 allen salesman   7369 87/12/20 1600  300  30
  7839 king  president                5000
*/
create table Employee(
�����ȣ number(4),
����̸� varchar(10),
���� varchar(10),
��� number(4),
�Ի��� date,
�޿� number(7,2),
Ŀ�̼� number(7,2),
�μ���ȣ number(2)
);
select * from Employee;
insert into Employee(�����ȣ, ����̸�, ����, ���, �Ի���, �޿�, �μ���ȣ) values(7369, 'smith', 'clerk', 7836, to_date(19801217, 'YY/MM/DD'), 800, 20); 
insert into Employee values(7499, 'allen', 'salesman', 7369, to_date(19871220, 'YY/MM/DD'), 1600, 300, 30);
insert into Employee(�����ȣ, ����̸�, ����, �޿�) values(7839, 'king', 'president', 5000);
rollback;

show user;

create user orauser01 identified by user01;
