create user orauser01 identified by user01;
show user;

-- 권한 부여
grant create session, create table to orauser01;
-- 명령어 전체 권한 부여
grant connect, resource to orauser01;
-- 명령어 지정하여 권한 부여
grant create session to orauser01;
grant create table to orauser01;

-- 명령어를 지정하여 권한 회수
revoke create session from orauser01;
revoke create table from orauser01;
-- 명령어 전체 권한 회수
revoke resource from orauser01;
