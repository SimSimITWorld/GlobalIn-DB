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

INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(1, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(2, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(3, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(4, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(5, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(6, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(7, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(8, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(9, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(10, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(11, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(12, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(13, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(14, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(15, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(16, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(17, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(18, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(19, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
INSERT INTO PROPRAC_FREE(NO, TITLE, WRITER, PASS, CONTENT, REF, STEP, DEPTH, REGDATE) VALUES(20, '자유롭게 이용해주세요.', '관리자', 'system_master', '안녕하세요. 요기조기 입니다. 상스러운 글만 자제해주시고 자유롭게 이용하시면 됩니다. 감사합니다.', 1, 0, 0, SYSDATE);
