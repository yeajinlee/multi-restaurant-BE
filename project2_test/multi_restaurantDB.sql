CREATE USER MultiRestaurant_DB
IDENTIFIED BY m1234
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT TO MultiRestaurant_DB; 
GRANT RESOURCE TO MultiRestaurant_DB; 
GRANT DBA TO MultiRestaurant_DB;


CREATE TABLE User_Info(
    user_ID VARCHAR2(20) PRIMARY KEY,
    user_PW VARCHAR2(20) NOT NULL,
    user_Nickname VARCHAR2(20) DEFAULT 'ȸ��',
    user_Birth INT,
    user_gender INT,
    user_City VARCHAR2(20),
    user_Email VARCHAR2(20),
    user_Phone varchar2(30),
    user_level INT DEFAULT 1,
    user_profile VARCHAR2(50)
);

CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
    rest_Social VARCHAR2(50),
    rest_OpenDate DATE NOT NULL
);



CREATE TABLE LikeRest_Info (
    like_NO INT PRIMARY KEY,
    user_ID VARCHAR2(20),
    rest_NO INT,
    CONSTRAINT FK_likeID FOREIGN KEY (user_ID)
    REFERENCES User_Info (user_ID)
    ON DELETE CASCADE
);

-- DROP TABLE LikeRest_Info;

-- like_NO �� AI(Auto Increment �ڵ�����) �� �����Ϸ��� ������ ����Ŭ�� AI�� �����Ƿ� Sequence ���
-- start with ������ �� INcrement By ������ �� Maxvalue ������ �� ��ȯ ����, cache ��� ����
CREATE SEQUENCE like_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

-- �Է��� ��
-- INSERT INTO LikeRest_Info(like_no, user_ID, rest_NO) VALUES(like_seq.NEXTVAL, '�������̵�' , 'rest_NO��');

CREATE TABLE Review_Info (
    review_NO INT PRIMARY KEY,
    user_ID VARCHAR(20) NOT NULL,
    review_Scope INT NOT NULL,
    review_Text VARCHAR(200) NOT NULL,
    rest_NO INT NOT NULL,
    review_Date DATE DEFAULT SYSDATE,
    CONSTRAINT FK_reviewID FOREIGN KEY (user_ID)
    REFERENCES User_Info (user_ID)
    ON DELETE CASCADE,
    CONSTRAINT FK_reviewRest FOREIGN KEY (rest_NO)
    REFERENCES Restaurant_Info (rest_NO)
    ON DELETE CASCADE
);

CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;



CREATE TABLE ReviewIMG_Info (
    img_FileNO INT PRIMARY KEY,
    img_FileName VARCHAR2(50),
    review_NO INT,
    rest_NO INT,
    CONSTRAINT FK_imgReview FOREIGN KEY (review_NO)
    REFERENCES Review_Info (review_NO)
    ON DELETE CASCADE
);

CREATE SEQUENCE reviewIMG_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;


CREATE TABLE Tag_Info (
    tag_NO INT PRIMARY KEY,
    tag_Name VARCHAR(20)
);
CREATE SEQUENCE tag_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

CREATE TABLE Rest_Tag (
    rest_NO INT,
    tag_NO INT,
    CONSTRAINT FK_tag_restNO FOREIGN KEY (rest_NO)
    REFERENCES Restaurant_Info (rest_NO)
    ON DELETE CASCADE,
    CONSTRAINT FK_tag_tagNO FOREIGN KEY (tag_NO)
    REFERENCES Tag_Info (tag_NO)
    ON DELETE CASCADE
);

-- user_info
insert into user_info(user_id, user_pw, user_nickname) values ('a0001', 'a0001', '�׽�Ʈ �̸�');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0002', 'a0002', '�׽�Ʈ�̸�2', '1993', 1, '����', 'a0002@gmail.com', '01000000000', 1);

-- restaurant_info
insert into restaurant_info (rest_no, rest_name, rest_price, rest_address, rest_opendate)
    values (1, '�׽�Ʈ�Ĵ�1', '0������', '����� ������', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(2, '�׽�Ʈ�Ĵ�2', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(3, '�׽�Ʈ�Ĵ�3', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(4, '�׽�Ʈ�Ĵ�4', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(5, '�׽�Ʈ�Ĵ�5', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(6, '�׽�Ʈ�Ĵ�6', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(7, '�׽�Ʈ�Ĵ�7', '0������', '��⵵', '020000000', '5', '�ν�Ÿ�׷�', sysdate);

-- review_info
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 5, '�׽�Ʈ ����', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 5, '�׽�Ʈ ����3', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����4', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����5', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����6', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����7', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����8', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 5, '�׽�Ʈ ����9', 7, sysdate);

-- reviewimg_info
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pizza.jpg', 1, 1);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi.jpg', 2, 2);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pasta.jpg', 5, 3);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi2.jpg', 6, 4);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'burger.jpg', 7, 5);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sush3.jpg', 8, 6);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'kimbap.jpg', 9, 7);

commit;

SELECT * FROM user_info;
SELECT * FROM restaurant_info;
SELECT * FROM likerest_info;
SELECT * FROM review_info;
SELECT * FROM reviewimg_info;
SELECT * FROM tag_info;
SELECT * FROM rest_tag;

SELECT * FROM review_info where mod(review_no,2)=0;
SELECT * FROM review_info where mod(review_no,2)=1;

DROP TABLE rest_tag;
DROP TABLE tag_info;
DROP TABLE reviewimg_info;
DROP TABLE review_info;
DROP TABLE likerest_info;
DROP TABLE restaurant_info;
DROP TABLE user_info;


drop SEQUENCE like_seq;
drop sequence review_seq;
drop sequence reviewIMG_seq;
drop sequence tag_seq;