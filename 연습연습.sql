CREATE TABLE MOON (
NO NUMBER NOT NULL,
TITLE VARCHAR2(100) NOT NULL,
WRITER VARCHAR2(100) NOT NULL,
WRITEDAY DATE,
VIEWER NUMBER(1) NOT NULL,
PRIMARY KEY(NO)
);

DESC MOON;

CREATE SEQUENCE MOON2_SEQ 
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCACHE
NOCYCLE;
COMMIT;

INSERT INTO MOON VALUES(MOON2_SEQ.NEXTVAL, 'ȫ�浿', '����', TO_DATE(20230203, 'YYYY/MM/DD'), 1);