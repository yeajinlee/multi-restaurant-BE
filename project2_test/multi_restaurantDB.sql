CREATE TABLE rest_Image 
   (	IMAGE_ID int primary key, 
	rest_NO int, 
	FILENAME VARCHAR2(50), 
	REG_ID VARCHAR2(30), 
	FILETYPE VARCHAR2(40)	
   ) ;
   
Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (2,3,'1.jpg','admin','main_image');
Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (1,1,'hon','admin','main_image');
drop table rest_image;
SELECT * FROM restaurant_info;
SELECT * FROM rest_image;


CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
        rest_Social VARCHAR2(50),
        rest_fileName varchar(20),
    rest_OpenDate DATE NOT NULL
);
 insert into Restaurant_Info (rest_NO, rest_Name, rest_Price , rest_Address , rest_Phone , rest_Scope , rest_Social, rest_fileName,  rest_OpenDate) values (1,'����������','10����','����','131313',1,1,'hon',sysdate);
insert into restaurant_info (rest_no, rest_name, rest_price, rest_address, rest_opendate)
    values (3, '�Ĵ��̸�', '���ݴ�', '�ּ�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values('2', '�׽�Ʈ�Ĵ�2', '0������', '����� ������', '020000000', '5', '�ν�Ÿ�׷�', sysdate);
    
    drop table Restaurant_Info;
    
    select ri.*, rm.fileName from Restaurant_Info ri, rest_Image rm where
     ri.rest_NO=rm.rest_NO and rm.filetype='main_image'
     and ri.rest_Name like '#{searchWord}%';
    
    
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
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0001', 'a0001', '�׽�Ʈ�̸�1', '1991', 1, '����', 'a0001@gmail.com', '01000000000', 1, 'pizza.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0002', 'a0002', '�׽�Ʈ�̸�2', '1992', 2, '����', 'a0002@gmail.com', '02000000000', 2, 'pasta.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0003', 'a0003', '�׽�Ʈ�̸�3', '1993', 1, '�λ�', 'a0003@gmail.com', '03000000000', 1, 'sushi.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0004', 'a0004', '�׽�Ʈ�̸�4', '1994', 2, '����', 'a0004@gmail.com', '04000000000', 2);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0005', 'a0005', '�׽�Ʈ�̸�5', '1995', 1, 'û��', 'a0005@gmail.com', '05000000000', 1);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0006', 'a0006', '�׽�Ʈ�̸�6', '1996', 2, '����', 'a0006@gmail.com', '06000000000', 2, 'sushi2.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0007', 'a0007', '�׽�Ʈ�̸�7', '1997', 1, '����', 'a0007@gmail.com', '07000000000', 2, 'burger.jpg');



-- restaurant_info
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(1, '�׽�Ʈ�Ĵ�1', '0������', '���� �ϱ�', '01000000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(2, '�׽�Ʈ�Ĵ�2', '0������', 'õ�� ������', '0200000000', '4', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(3, '�׽�Ʈ�Ĵ�3', '0������', '�����ֽ�', '0300000000', '3', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(4, '�׽�Ʈ�Ĵ�4', '0������', '���� ���α�', '0400000000', '4', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(5, '�׽�Ʈ�Ĵ�5', '0������', '�λ� �λ�����', '0500000000', '5', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(6, '�׽�Ʈ�Ĵ�6', '0������', '���� ��걸', '0600000000', '4', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(7, '�׽�Ʈ�Ĵ�7', '0������', '�뱸 �޼���', '0700000000', '3', '�ν�Ÿ�׷�', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social, rest_OpenDate)
    values(8, '�׽�Ʈ�Ĵ�8', '0������', '���� �����', '0800000000', '5', '�ν�Ÿ�׷�', sysdate);

-- review_info
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 5, '�׽�Ʈ ����1', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 4, '�׽�Ʈ ����2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '�׽�Ʈ ����3', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 2, '�׽�Ʈ ����4', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 1, '�׽�Ʈ ����5', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 2, '�׽�Ʈ ����6', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '�׽�Ʈ ����7', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 4, '�׽�Ʈ ����8', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0005', 5, '�׽�Ʈ ����9', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0006', 5, '�׽�Ʈ ����10', 4, sysdate);

-- reviewimg_info
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pizza.jpg', 1, 1);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi.jpg', 2, 2);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pasta.jpg', 3, 3);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi2.jpg', 4, 4);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'burger.jpg', 5, 5);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi3.jpg', 6, 6);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'kimbap.jpg', 7, 7);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pizza.jpg', 1, 1);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi.jpg', 7, 6);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'pasta.jpg', 3, 3);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi2.jpg', 8, 4);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'burger.jpg', 5, 5);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi3.jpg', 6, 6);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'kimbap.jpg', 7, 7);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi4.jpg', 9, 2);
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, 'sushi5.jpg', 2, 2);


commit;

SELECT * FROM user_info;
SELECT * FROM likerest_info;
select * from restaurant_info;
SELECT * FROM review_info;
SELECT * FROM reviewimg_info;
SELECT * FROM tag_info;
SELECT * FROM rest_tag;

SELECT * FROM review_info where mod(review_no,2)=0;
SELECT * FROM review_info where mod(review_no,2)=1;

select c.review_no, c.user_id, c.review_text, c.review_scope, c.review_date, c.user_nickname, c.user_profile, d.img_filename 
from (SELECT a.review_no, a.user_id, a.review_text, a.review_scope, a.review_date, a.rest_no, b.user_nickname, b.user_level, b.user_profile FROM review_info a left outer join user_info b on a.user_id = b.user_id where mod(review_no,1)=0) c left outer join reviewimg_info d on c.review_no = d.review_no;

select c.review_no, c.user_id, c.review_text, c.review_scope, c.review_date, c.user_nickname, c.user_profile, d.img_filename from (SELECT a.review_no, a.user_id, a.review_text, a.review_scope, a.review_date, a.rest_no, b.user_nickname, b.user_level, b.user_profile FROM review_info a left outer join user_info b on a.user_id = b.user_id where mod(review_no,2)=0) c left outer join reviewimg_info d on c.review_no = d.review_no;


-- �� ����: ����������+�������� ��ġ (������������ ���俵��)
create view profile_review as
select
user_info.USER_ID as user_ID,
user_info.USER_NICKNAME as user_Nickname,
user_info.USER_LEVEL as user_Level,
user_info.USER_PROFILE as user_Profile,
review_content_img.REVIEW_NO as review_No,
review_content_img.REVIEW_SCOPE as review_Scope,
review_content_img.REVIEW_TEXT as review_Text,
review_content_img.REST_NO as rest_NO,
review_content_img.REVIEW_DATE as review_Date,
review_content_img.IMAGES as images from user_info right outer join review_content_img on user_info.user_id = review_content_img.user_id;
select * from profile_review;

drop view profile_review;

-- �� ����: ��������+�ش� �����̹���
CREATE view review_content_img as
select review.REVIEW_NO,
review.USER_ID,
review.REVIEW_SCOPE,
review.REVIEW_TEXT,
review.REST_NO,
review.REVIEW_DATE,
review_img.IMAGES from review_info review left outer join review_img on review.review_no = review_img.review_no;
select * from  review_content_img;
drop view review_content_img;

--�� ����: ���� ��ȣ + �ش��ϴ� �����̹���
create view review_img as
select review_no, listagg(img_filename, '/') within group(order by img_filename) as images from reviewimg_info group by review_no;
select * from review_img;

-- ���ο� �Ĵ�����+�̹���
select b.rest_no, b.rest_name, b.rest_price, b.rest_address, b.rest_scope, b.rest_social, b.rest_opendate, a.img_filename 
from (select row_number() over(partition by rest_no order by img_fileno) as rnum, reviewimg_info.* from reviewimg_info) a 
left outer join restaurant_info b on a.rest_no = b.rest_no where rnum = 1 and rownum < 7;

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





