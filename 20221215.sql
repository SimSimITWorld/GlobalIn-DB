
/*

  �����Լ� : ���� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
            ���� �����͸� �����Ͽ� ��ȯ�� ���� ���� ��ȯ�ϴ� �Լ�
            
                                           * ǥ�� : ���� ���� �Լ�
  ����      ����
  ----------------------------------------------------------------
  ABS       ���밪�� ��ȯ
  COS       cosine ���� ��ȯ
  EXP       e �� n ���� ��ȯ
  FLOOR     �Ҽ��� �Ʒ��� �߶����  *
  LOG       log���� ��ȯ
  POWER     power(m, n)�������� m�� n���� ��ȯ��
  SIGN      sign(n) n < 0�̸� -1, n=0, n > 0�̸� 1�� ��ȯ
  SIN       sine���� ��ȯ
  TAN       tangent���� ��ȯ
  ROUND     Ư�� �ڸ������� �ݿø�  *
  TRUNC     Ư�� �ڸ������� �߶�  *
  MOD       �Է¹��� ���� ���� ������ ���� ��ȯ  *

*/

select abs(-15) from dual;
select floor(34.5678) from dual;

select round(12345.4678),
round(1234.5678, 0), -- �Ҽ��� ù° �ڸ����� �ݿø�
round(1234.5678, 1),
round(1234.5678, 2),
round(1234.5678, -1),
round(1234.5678, -2)
from dual;

select mod(34, 7) from dual;

/*
  ��¥�Լ� : ��¥ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
            Data(��¥)���� ����ϴ� �Լ��̸� ��������� �Ǵ� �Ⱓ�� ��´�.
            �Ⱓ�� �ַ� �� ������ �������� �� ������ ���Ǵ� ��쵵 �ִ�.
            
  SYSDATE           : �ý��ۿ� ����� ���� ��¥�� ��ȯ
  MONTHS_BETWEEN    : �� ��¥ ���̰� �� ���� ���̰� �������� ��ȯ
  ADD_MONTH         : Ư���� ��¥�� ���� ���� ���� ��
  NEXT_DAY          : Ư���� ��¥�� ���ʷ� �����ϴ� ���ڷ� ���� ������ ��¥�� ��ȯ
  LAST_DAY          : �ش� ���� ������ ��¥�� ��ȯ
  ROUND             : ���ڷ� ���� ��¥�� �������� �ݿø��Ѵ�.
  TRUNC             : ���ڷ� ���� ��¥�� �������� ����
*/

select sysdate from dual;
select substr(sysdate, -2,2) from dual;
select sysdate-1 ����, sysdate ����, sysdate+1 ���� from dual;
select last_day(sysdate) from dual;


  
select * from emp;
select ename,deptno,hiredate,round(sysdate-hiredate) �ٹ��ϼ� from emp where deptno=10 ;

select ename,deptno,sysdate,hiredate, round(months_between(sysdate, hiredate)) from emp where deptno=10;

select ename,deptno,round(add_months(sysdate, 3)) "3���� ��" from emp where deptno=10;

-- next_day : �ش� ������ ���� ����� ��¥�� ��ȯ�ϴ� �Լ�
-- next_day(date, ����)

alter session set nls_language=korean;
select sysdate, next_day(sysdate, '������') from dual;


/*
  ��ȯ�Լ� : ����, ��¥, ���� ���� ���� �ٸ� Ÿ������ ��ȯ�Ͽ� ��Ÿ��
            �ڷ����� ��ȯ��Ű���� �� �� ����ϴ� �Լ�
            
  TO_CHAR   : ��¥�� Ȥ�� �������� ���������� ��ȯ
  TO_DATE   : �������� ��¥������ ��ȯ
  TO_NUMBER : �������� ���������� ��ȯ

  TO_CHAR(��¥ ������, '�������')
  
  YYYY  : �⵵ 4�ڸ�
  YY    : �⵵ 2�ڸ�
  MM    : ���� ���ڷ�
  MON   : ���� ���ĺ�����
  DD    : �� ǥ��
  DAY   : ���� ǥ��
  DY    : ������ ���� ǥ��
*/
select sysdate,to_char(sysdate, 'YYYY-MON-DD DY, HH:MI:SS') from dual;
select * from emp;
select ename,hiredate from emp where hiredate=to_date(19810220, 'YYYYMMDD');
select sysdate-to_date('2022/01/01') from dual;
select trunc(sysdate-to_date('2022/01/01')) from dual;

/*
  TO_NUMBER : �������� ���������� ��ȯ
     - ���������� ��ȯ�ϴ� �Լ�
*/
select to_number('10,000','999,999')+to_number('20,000','999,999') from dual;


/*
  NVL       : ù��° ���ڷ� ���� ���� NULL�� ������ �ι�° ���� ������ ����
  DECODE    : ù��° ���ڷ� ���� ���� ���ǿ� ���缭 ����(IF�� ����)
  CASE      : ���ǿ� �´� ������ ����(SWITCH ~ CASE���� ����)
*/

-- NVL : NULL�� �ٸ� ������ ��ȯ�ϴ� �Լ�
--       NULL�� 0 �Ǵ� �ٸ� ������ ��ȯ�ϱ� ���� �Լ�

select ename, sal, comm, job from emp order by job;
select ename, sal, NVL(comm, 0), job from emp order by job;
select ename, sal, comm, sal*12+NVL(comm, 0), job from emp order by job;

/*
  DECODE : ù��° ���ڷ� ���� ���� ���ǿ� ���缭 ����(IF�� ����)
  DECODE(ǥ����, ����1, ���1,
                 ����2, ���2,
                 ����3, ���3,
                 �⺻��� N)
*/
select * from dept;
select deptno from emp;
select deptno, decode(deptno, 10, 'ACCOUNTING',
                              20, 'RESEARCH',
                              30, 'SALES',
                              40, 'OPERATIONS') as "�μ��̸�"
from emp;


/*
  CASE �Լ�  
  ���ǿ� ���� ���� �ٸ� ó���� �����ϴ�.
    CASE ǥ���� WHEN ����1 THEN ���1
                WHEN ����2 THEN ���2
                WHEN ����3 THEN ���3
                ELSE ��� N
  END
*/

           select deptno,  case when deptno=10 THEN 'ACCOUNTING'
                            when deptno=20 THEN 'RESEARCH'
                            when deptno=30 THEN 'SALES'
                            when deptno=40 THEN 'OPERATIONS'
                            ELSE '���½ð��Դϴ�.'
                            END
                            AS "�μ���"
from emp;

/*
  ��]
     ���޿� ���� �޿��� �λ��ϵ��� ����.(�����ȣ, �����, ����, �޿�)
     ������ 'ANALYST' �� ����� 5%,
            'SALESMAN' �� ����� 10%,
            'MANNAGER' �� ����� 15%,
            'CLERK' �� ����� 20% �λ��Ѵ�.
*/
select * from emp;
select empno �����ȣ, ename �����, job ���� ,sal �޿�,
case when job = 'ANALYST' then sal*1.05 
     when job = 'SALESMAN' then sal*1.1
     when job = 'MANAGER' then sal*1.15
     when job = 'CLERK' then sal*1.2
     else sal
     end ���� from emp order by sal;



select avg(sal) from emp;
select distinct(deptno) from emp;
select deptno, sum(sal), trunc(avg(sal)) from emp group by deptno;
select deptno, MAX(sal), MIN(sal) from emp group by deptno;


-- �μ����� ����� ���� Ŀ�̼��� �޴� ����� ���� ī��Ʈ �Ͻÿ�.
select deptno,count(*),count(comm) from emp group by deptno;
select deptno, MAX(sal), MIN(sal), trunc(avg(sal)) from emp group by deptno having avg(sal)>=2000;
select deptno, MAX(sal), MIN(sal) from emp group by deptno having avg(sal)>2900;








