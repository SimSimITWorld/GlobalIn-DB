/*
   select
      - �����ͺ��̽��κ��� ������ �˻��� �� �ִ� ��ɾ��̴�.
      - ������ �ο��ؼ� Ư���� �ο�(��)�� ��ȸ�Ѵ�.
      - Ư�� �÷�(��)�� �������� �������� �Ǵ� ������������ �����Ѵ�.
      
   ����
      select 
      * : ��� �÷��� �ǹ���
      �÷���, �÷���,... 
      from ���̺��
*/

select 
deptno,
loc from 
dept WHERE deptno=10 or deptno=20;

select * from tab;
-- emp ���̺��� ��� ������ ����Ͻÿ�

select * from emp;
select * from dept;

desc dept;

-- dept ���̺��� �μ���ȣ�� �μ��� ���
-- �÷��� �̸��� ����ؼ� Ư�� �÷��� ��ȸ�ϱ�
select deptno, dname from dept;


-- ������̺��� �̸���, �޿���, �Ի����� ����Ͻÿ�
select * from tab;
select * from emp;

select ename, sal, hiredate from emp;

-- �÷� �̸��� ��Ī �����ϱ�
select deptno as "DepartmentNo" from dept;
select deptno from dept;

/*
  �÷��� ����� �ٷ� �ڿ� as ��� Ű���带 �� �� ��Ī�� ����Ѵ�. 
  ��Ī�� ���鹮�ڳ� $, _, # �� Ư�����ڸ� ǥ���ϰ� �Ͱų� ��ҹ��ڸ� �����ϰ� ������
  " "�� ����ϸ� �ȴ�.
  as�� �����ϰ� " "�� ����Ͽ��� ��Ī ��� ���� 
*/
select deptno "$$$$$" from dept;
select deptno as �μ���ȣ from dept;
 
 
select deptno �μ���ȣ, dname �μ��� from dept;
 
 
select * from emp;
 
select distinct job from emp; 
 
select distinct deptno from emp;
 
 
 -- =, >, <, >=, <=, (!=, ^=, <>) <-- �� 3���� �ٸ��ٴ� ���� �ǹ�
 

 -- �޿��� 3000�̻� �޴� ����� ����ϵ�, �����ȣ, ����̸�, �޿��� ����Ͻÿ�.
 
select empno, ename, sal from emp where sal>=3000;

 -- �޿��� 3000�̸� �޴� ����� ����ϵ�, �����ȣ, ����̸�, �޿��� ����Ͻÿ�.

select empno, ename, sal from emp where sal<3000;
 
select * from emp where deptno=10;

 -- �޿��� 2000�̸� �޴� ����� ����ϵ�, �����ȣ, ����̸�, �޿��� ����Ͻÿ�.

select empno, ename, sal from emp where sal<2000;

/*
  ���� ������ ��ȸ
    - ���ڵ����ʹ� �ݵ�� ���ϵ���ǥ(�̱�����) �ȿ� ǥ���Ѵ�.
      ��ҹ��ڸ� �����Ѵ�.
*/

select empno, ename, sal from emp where ename = 'SCOTT';

-- �̸��� MILLER�� ����� �����ȣ�� ����̸��� ������ ����Ͻÿ�.
select empno, ename, job from emp where ename = 'MILLER';

/*
  ��¥ ������ ��ȸ
    - �ݵ�� ���� ����ǥ �ȿ� ǥ����
      ���� : ��/��/��
      1985�� ���Ŀ� �Ի��� ������� �̸��� �Ի����� ����Ͻÿ�.
*/

select * from emp;

select ename, hiredate from emp where hiredate>='1985/01/01';

/*
  AND ������
    - ���� ������ ��� �����ؾ��� ��� ����ϴ� ������
    
    ��] �μ���ȣ�� 10���̰� ������ MANAGER�� ����� �̸�, �μ���ȣ, ������ ����Ͻÿ�.
*/
select ename, deptno, job from emp where deptno=10 and job='MANAGER';
-- �޿��� 1000���� 3000���̿� �ִ� ����� ��� ������ ����Ͻÿ�.
select * from emp where sal>=1000 and sal<=3000;

/*
  OR ������
    - �ΰ��� ���� �� �ϳ��� �����ϴ��� �˻��� �����ϴ�.
    
    ��1] �μ���ȣ�� 10���̰ų� ������ MANAGER�� ����� �̸�, �μ���ȣ, ������ ����Ͻÿ�.
*/
select ename,deptno,job from emp where deptno=10 or job = 'MANAGER';

-- ��2] �����ȣ�� 7844�̰ų� 7654�̰ų� 7521�� ����� ��� ������ ����Ͻÿ�.
select * from emp where empno=7844 or empno=7654 or empno=7521;

-- not ������ : �ݴ�Ǵ� ������  
-- ��3] �μ���ȣ�� 10�� �ƴ� ����� ��� ������ ����Ͻÿ�.`
select * from emp where not deptno=10;

select * from emp where not job='MANAGER';

/*
  BETWEEN AND ������
    - Ư�� ���� ���� ���ϴ� �����͸� �˻��� �� ����ϴ� ������
      �÷��� BETWEEN A AND B
      
   ��1] �޿��� 1000���� 3000������ �ִ� ��������� ����Ͻÿ�.    
*/
select * from emp where sal>=1000 and sal<=3000;
select * from emp where sal between 1000 and 3000;

-- ��2] �޿��� 1500�� 2500 ������ ����� �����ȣ, ����̸�, �޿��� ����Ͻÿ�.
--      ��, and �����ڿ� between and �����ڸ� ����Ͽ� ����Ͻÿ�.
select empno, ename, sal from emp where sal>=1500 and sal<=2500;
select empno, ename, sal from emp where sal between 1500 and 2500;

-- �����ȣ�� 7844�̰ų� 7654�̰ų� 7521�� ����� ��� ������ ����Ͻÿ�.
select * from emp where empno=7844 or empno=7654 or empno=7521;

-- in ������
--   - ������ �÷��� �������� �� �߿��� �ϳ������� �˾ƺ����� �� �� ����ϴ� ������
select * from emp where empno in(7844, 7654, 7521); 

-- Ŀ�̼��� 300�̰ų� 500�̰ų�, 1400 �� �ϳ��� ����� �̸�, �޿�, Ŀ�̼��� ����Ͻÿ�.
select ename, sal, comm from emp where comm=300 or comm=500 or comm=1400;
select ename, sal, comm from emp where comm in(300, 500, 1400);

