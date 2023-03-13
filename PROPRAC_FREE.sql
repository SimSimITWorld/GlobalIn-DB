CREATE TABLE PROPRAC_FREE (
NO          NUMBER(7)       NOT NULL,
TITLE       VARCHAR2(200)   NOT NULL,
WRITER      VARCHAR2(30)    NOT NULL,
PASS        VARCHAR2(30)    NOT NULL,
CONTENT     VARCHAR2(4000)  NOT NULL,
READCOUNT   NUMBER(5)       DEFAULT 0 NOT NULL,
REF         NUMBER(5)       DEFAULT 0 NOT NULL,
STEP        NUMBER(3)       DEFAULT 0 NOT NULL,
DEPTH       NUMBER(3)       DEFAULT 0 NOT NULL,
REGDATE     TIMESTAMP(6)    DEFAULT SYSDATE NOT NULL,
CONSTRAINT  PROPRAC_FREE_PK PRIMARY KEY(NO)
);

COMMIT;

SELECT * FROM PROPRAC_FREE;

CREATE SEQUENCE PROPRAC_FREE_SEQ
START WITH 2
INCREMENT BY 1
NOMAXVALUE
NOCACHE
NOCYCLE;

INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(1, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(2, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(3, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(4, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(5, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(6, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(7, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(8, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(9, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(10, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(11, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(12, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(13, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(14, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(15, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(16, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(17, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(18, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(19, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(20, '�����Ӱ� �̿����ּ���.', '������', 'system_master', '�ȳ��ϼ���. ������� �Դϴ�. �󽺷��� �۸� �������ֽð� �����Ӱ� �̿��Ͻø� �˴ϴ�. �����մϴ�.', 1, 0, 0, SYSDATE);
