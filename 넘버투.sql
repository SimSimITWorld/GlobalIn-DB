create user orauser01 identified by user01;
show user;

-- ���� �ο�
grant create session, create table to orauser01;
-- ��ɾ� ��ü ���� �ο�
grant connect, resource to orauser01;
-- ��ɾ� �����Ͽ� ���� �ο�
grant create session to orauser01;
grant create table to orauser01;

-- ��ɾ �����Ͽ� ���� ȸ��
revoke create session from orauser01;
revoke create table from orauser01;
-- ��ɾ� ��ü ���� ȸ��
revoke resource from orauser01;
