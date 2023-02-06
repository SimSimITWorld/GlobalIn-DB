/*
  LIKE ������
    - �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ��� ���ϵ� ī��� �Բ� ����Ͽ� ���ϴ�
      ������ �˻��ϴ� ������
      
      �÷��̸� LIKE ����
      ���ϵ� ī�� ����
        % : ���ڰ� ���ų�, �ϳ� �̻��� ���ڰ� � ���� ���� ������� ���
            0 ~ n���� ���ڿ��� ��ü��
            
        _ : �ϳ��� ���ڰ� � ���� ������ �������
            �� �ѱ����� ���ڿ��� ��ü��
*/

-- %�� �˻��ϰ��� �ϴ� ���� ��Ȯ�� �� ���, %�� ��� ���ڰ� ���� ����� ����.
-- k�� �����ϴ� ����� �˻��Ͻÿ�.
select empno, ename from emp where ename like 'K%';  
-- k�� �����ϴ� ����� �˻��Ͻÿ�.
select empno, ename from emp where ename like '%K%'; 
-- k�� ������ ����� �˻��Ͻÿ�.
select empno, ename from emp where ename like '%K';  
select empno, ename from emp;

-- ����� ����Ȯ��
show user;

-- _�� �� ���ڸ� ����ؼ� ����ϴ� ��
-- ��] �̸��� �ι�° ���ڰ� A�� ����� �˻��Ͻÿ�.
select empno, ename from emp where ename like '_A%';
select empno, ename from emp where ename like '__N%';

select empno, ename from emp where ename not like '%A%';

select * from emp;
select ename, comm, job from emp where comm is not null;
/*
  NULL ������
    ����Ŭ������ �÷��� NULL���� ����Ǵ� ���� ����Ѵ�.
    NULL�� ��Ȯ��, �� �� ���� ���� �ǹ��ϸ�, 0�� ������� �ƴ� � ���� ����������,
           �˾� �� �� ���� ���� �ǹ��Ѵ�.
    NULL�� ����, �Ҵ�, �񱳰� �Ұ����ϴ�.
    
    
  NULL �� ����Ǿ� �ִ� ��쿡�� �񱳿�����(=)�δ� �Ǵ��� �� ����
  
  is null�� is not null
  
  is null     : ���� null�̸� ����
  is not null : ���� null�� �ƴϸ� ����
*/

-- ��] �ڽ��� ���ӻ���� ���� ����� �̸�, ����, ���ӻ���� ����� ����Ͻÿ�.
-- select ename, mgr from emp where ; ���� �ϼ���Ű�ÿ�. 
select ename, job CEO, mgr from emp where mgr is null;



/*
  ������ ���� order by ��
  order by ���� �ο�(��)�� �����ϴµ� ����ϸ� ������ �� �ڿ� ����Ѵ�.
  ������ ������ �Ǵ� �÷� �̸� �Ǵ� select ������ ��õ� ��Ī�� ����� �� �ִ�.
  
              ��������(ASC)             ��������(DESC)
  ����         ���� ������                ū ������
  ����         ���� ������              ���� �ݴ� ����
  ��¥         ���� ��¥��              ���� ��¥ ����
  NULL      ���� �������� ����          ���� ���� ����
  
  ***** �������� ��� �ҹ��ڸ� ���� ū ������ �ϰ�, null ���� ��� �� �� ���� ���� ������ �ν���
*/
select * from emp;
-- ����� �������� �������� �Ͻÿ�
select empno, ename from emp order by empno DESC;

-- ��] ����� ���, �̸�, �޿��� �޿��� ���� ������ ����Ͻÿ�.
select ename, empno, sal from emp order by sal DESC;

-- ��] �Ի����� ���� �ֱ��� ��� ������ ����ϵ�, ���, �̸�, �Ի����� ����Ͻÿ�.
select empno, ename, hiredate from emp order by hiredate DESC;

-- ��] �޿��� ���� ����� ������ ��� �̸��� ö���� ������ ���� ����� �������� ����Ͻÿ�
select empno, ename, sal from emp order by sal desc, ename ASC;

/*
  dual ���̺�
    - ����Ŭ���� 1���� �� ������ ȯ���ϰ��� �Ѵ�.
      1���� 24�ð��̰� 1�ð��� 60���̸� 1���� 60���̹Ƿ� 24*60*60 �ϸ�
      �Ϸ簡 �������� ����, �̷� ����� ��������
      ���� ������� ����Ŭ ������Ʈ�� �ٷ� �Է��ϸ� ������ �߻���
      �ֳ��ϸ� 24*60*60�� sql���� ������ ������ ���� ����̱� �����̴�. 
      
      dual ���̺��� ��������̳� �����÷� ���� ���� �ѹ��� ����ϰ� ���� �� ����ϴ� ���� 
      ������ ���̺�μ� DUMMY ��� �Ѱ��� �÷����� ������ ���̺��̴�.
      DUMMY �÷����� �Ѱ��� ���ڸ� ������ �� �ְ� �� �ϳ��� �ุ �����Ѵ�.
*/

select 20*2 from dual;
desc dual;
select 24*60*60 from dual;
select * from dual;

select deptno, sal from emp where deptno=30 order by sal desc;

select deptno, sal from emp where deptno=30;

select deptno, sum(sal) from emp group by deptno having deptno=30;

/*
  ������ �Լ� : �ึ�� �Լ��� ����Ǿ� ����� ��ȯ��
    - �����Լ� : ���ڿ��� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
    - �����Լ� : ������ ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
    - ��¥�Լ� : ��¥�� ���� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
    - ��ȯ�Լ� : ����, ����, ��¥ ���� ���� �ٸ� Ÿ������ ��ȯ�Ͽ� ��Ÿ��
    - �Ϲ��Լ� : ��Ÿ�Լ�
  
  �׷� �Լ� : �ϳ� �̻��� ���� �׷����� ���� �����Ͽ� ����� �����Ѵ�.
    - sum : �׷��� ���� �հ踦 ��ȯ�� 
    - avg : �׷��� ����� ��ȯ��
    - count : �׷��� �� ������ ��ȯ��
    - max : �׷��� �ִ밪�� ��ȯ�� 
    - min : �׷��� �ּҰ��� ��ȯ��
    - stddev : �׷��� ǥ�������� ��ȯ��
    - variance : �׷��� �л��� ��ȯ��
*/

/*
  �����Լ� : ���ڿ��� �ٸ� ���·� ��ȯ�Ͽ� ��Ÿ��
             �������� ���� �����Ͽ� ��ȯ�� ���� ���� ��ȯ��
             
  - LOWER : �ҹ��ڷ� ��ȯ
  - UPPER : �빮�ڷ� ��ȯ
  - INITCAP : ù���ڸ� �빮�ڷ� ��ȯ �������� �ҹ��ڷ� ��ȯ
  - CONCAT : ������ ���� ����
  - SUBSTR  : ���ڸ� �߶� ������(�ѱ� 1byte)
  - SUBSTRB : ���ڸ� �߶� ������(�ѱ� 2byte)
  - LENGTH : ������ ���̸� ��ȯ(1byte)
  - LENGTHB : ������ ���̸� ��ȯ(2byte) 
  - INSTR  : Ư�� ������ ��ġ ���� ��ȯ(�ѱ� 1byte)
  - INSTRB : Ư�� ������ ��ġ ���� ��ȯ(�ѱ� 2byte)
  - LPAD,RPAD : �Է¹��� ���ڿ��� ��ȣ�� �����Ͽ� Ư�� ������ ���ڿ��� ��ȯ
  - TRIM : ������ �߶󳻰� ���� ���ڸ� ǥ��
  - CONVERT : char set ��ȯ
  - CHR : ASCII �ڵ� ������ ��ȯ
  - ASCII : ASCII �ڵ� ���� ���ڷ� ��ȯ
  - REPLACE : ���ڿ����� Ư�� ���ڸ� ����
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

select substr('�����ͺ��̽�', 3, 4) from dual; -- ����Ʈ �� ����
select substrb('�����ͺ��̽�', 0, 3) from dual; -- ���� �� ����

