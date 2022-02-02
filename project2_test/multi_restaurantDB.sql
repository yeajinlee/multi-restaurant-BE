CREATE TABLE rest_Image 
(IMAGE_ID int primary key, 
	rest_NO int, 
	FILENAME VARCHAR2(50), 
	REG_ID VARCHAR2(30), 
	FILETYPE VARCHAR2(40)) ;
    
    
         Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (7,10,'non.jpg','admin','main_image');
     Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (6,9,'non.jpg','admin','main_image');
 Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (4,5,'non.jpg','admin','main_image');
 Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (3,4,'don.jpg','admin','sub_image');
 Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (2,3,'1.jpg','admin','main_image');
 Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (1,1,'hon.png','admin','main_image');
Insert into rest_Image (IMAGE_ID,rest_NO,FileName,REG_ID,FILETYPE) values (5,6,'non.jpg','admin','theme_image');

drop table rest_image;

SELECT DISTINCT rest_theme from Restaurant_Info;		

SELECT * FROM restaurant_info;
SELECT * FROM rest_image;
select rest_Address from Restaurant_Info;
select rest_NO, rest_Name, rest_Address from Restaurant_Info;


CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
    rest_Social VARCHAR2(50),
    rest_fileName varchar(20),
    rest_Theme varchar(20),
    rest_OpenDate DATE NOT NULL
);
insert into Restaurant_Info (rest_NO, rest_Name, rest_Price , rest_Address , rest_Phone , rest_Scope , rest_Social, rest_fileName, rest_theme, rest_OpenDate) 
                     values (10,'돈가스만남','10만원','성남','131313',1,1,'non.jpg','icecream', sysdate);

insert into Restaurant_Info (rest_NO, rest_Name, rest_Price , rest_Address , rest_Phone , rest_Scope , rest_Social, rest_fileName, rest_theme, rest_OpenDate) 
                     values (5,'돈가스천국','10만원','성남','131313',1,1,'non.jpg','icecream', sysdate);

insert into Restaurant_Info (rest_NO, rest_Name, rest_Price , rest_Address , rest_Phone , rest_Scope , rest_Social, rest_fileName, rest_theme,  rest_OpenDate) 
                     values (6,'돈가스나라','10만원','성남','131313',1,1,'hon.png','icecream', sysdate);
                  insert into Restaurant_Info (rest_NO, rest_Name, rest_Price , rest_Address , rest_Phone , rest_Scope , rest_Social, rest_fileName, rest_theme,  rest_OpenDate) 
                     values (9,'돈가스환영','10만원','성남','131313',1,1,'non.jpg','icecream', sysdate);   
                     
insert into restaurant_info (rest_no, rest_name, rest_price, rest_address, rest_opendate)
                     values (3, '식당이름', '가격대', '주소', sysdate);
                     
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme, rest_OpenDate)
                      values(2, '테스트식당2', '0만원대', '서울시 강남구', '020000000', '5', '인스타그램','coffee', sysdate);
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme, rest_OpenDate)
                      values(7, '테스트식당3', '0만원대', '서울시 강남구', '020000000', '5', '인스타그램','coffee', sysdate);    
                         
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme, rest_OpenDate)
                      values(4, '테스트식당2', '0만원대', '서울시 강남구', '020000000', '5', '인스타그램','zoffee', sysdate);
                      
insert into restaurant_info (rest_NO, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme, rest_OpenDate)
                      values(1, '테스트식당2', '0만원대', '서울시 강남구', '020000000', '5', '인스타그램','apple', sysdate);
           insert into restaurant_info (rest_NO, rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme, rest_OpenDate)
                      values(8,'coffee.jpg', '테스트식당4', '0만원대', '서울시 강남구', '020000000', '5', '인스타그램','coffee', sysdate);           
    commit;
    	select rest_theme from Restaurant_Info;
    
    drop table Restaurant_Info;
    
    select ri.*, rm.fileName from Restaurant_Info ri, rest_Image rm where
     ri.rest_NO=rm.rest_NO and rm.filetype='main_image'
     and ri.rest_Name like '#{searchWord}%';
     
select ri.rest_no, ri.rest_name, ri.rest_fileName, rw.review_text, ri.rest_theme 
from Restaurant_Info ri, Review_Info rw 
where ri.rest_no=rw.rest_no and ri.rest_theme='icecream';

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
    user_Nickname VARCHAR2(20) DEFAULT '회원',
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

-- like_NO 를 AI(Auto Increment 자동증가) 로 생성하려고 했으나 오라클엔 AI가 없으므로 Sequence 사용
-- start with 시작할 값 INcrement By 증가할 값 Maxvalue 최종값 값 순환 안함, cache 사용 안함
CREATE SEQUENCE like_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

-- 입력할 때
-- INSERT INTO LikeRest_Info(like_no, user_ID, rest_NO) VALUES(like_seq.NEXTVAL, '유저아이디값' , 'rest_NO값');

CREATE TABLE Review_Info (
    review_NO INT PRIMARY KEY,
    user_ID VARCHAR(20) NOT NULL,
    review_Scope INT NOT NULL,
    review_Text VARCHAR(200) NOT NULL,
    rest_NO INT NOT NULL
);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO)
    values (1, 'a0001', 5, '테스트 리뷰', 1);
    insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO)
    values (2, 'a0001', 5, '테스트 리뷰2', 2);
drop table Review_info;

CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

select ri.rest_no, ri.rest_name, ri.rest_fileName, rw.review_text, ri.rest_theme from Restaurant_Info ri, Review_Info rw where ri.rest_no=rw.rest_no;

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
insert into reviewimg_info (img_fileno, img_filename, review_no, rest_no) values (reviewimg_seq.nextval, pizza.jpg, 1, 1);


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


insert into user_info(user_id, user_pw, user_nickname) values ('a0001', 'a0001', '테스트 이름');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0002', 'a0002', '테스트이름2', '1993', 1, '서울', 'a0002@gmail.com', '01000000000', 1);

    
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (1, 'a0001', 5, '테스트 리뷰', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (2, 'a0002', 5, '테스트 리뷰2', 2, sysdate);
    insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (3, 'a0001', 5, '테스트 리뷰3', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (4, 'a0002', 5, '테스트 리뷰4', 2, sysdate);
    


SELECT * FROM user_info;

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