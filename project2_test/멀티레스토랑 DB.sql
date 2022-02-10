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
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0001', 'a0001', '테스트이름1', '1991', 1, '강남구', 'a0001@gmail.com', '01000000000', 1, 'pizza.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0002', 'a0002', '테스트이름2', '1992', 2, '강남구', 'a0002@gmail.com', '02000000000', 2, 'pasta.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0003', 'a0003', '테스트이름3', '1993', 1, '파주시', 'a0003@gmail.com', '03000000000', 1, 'sushi.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0004', 'a0004', '테스트이름4', '1994', 2, '파주시', 'a0004@gmail.com', '04000000000', 2);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0005', 'a0005', '테스트이름5', '1995', 1, '여의도시', 'a0005@gmail.com', '05000000000', 1);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0006', 'a0006', '테스트이름6', '1996', 2, '파주시', 'a0006@gmail.com', '06000000000', 2, 'sushi2.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0007', 'a0007', '테스트이름7', '1997', 1, '강남구', 'a0007@gmail.com', '07000000000', 2, 'burger.jpg');
   
   
    select * from restaurant_info; 
select * from User_Info;

IF (select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName,ri.rest_Scope from 
			Restaurant_Info ri, User_Info ui where ri.rest_Address=ui.user_city order by rest_OpenDate) = null then 
           (select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName,ri.rest_Scope from 
			Restaurant_Info ri) order by rest_OpenDate;
            
select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName,ri.rest_Scope from 
			Restaurant_Info ri;

CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
    rest_Social VARCHAR2(50),
    rest_City VARCHAR2 (20),
    rest_fileName varchar(50),
    rest_Theme varchar(20),
    rest_View INT DEFAULT 1,
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

-- like_NO 를 AI(Auto Increment 자동증가) 로 생성하려고 했으나 오라클엔 AI가 없으므로 Sequence 사용
-- start with 시작할 값 INcrement By 증가할 값 Maxvalue 최종값 값 순환 안함, cache 사용 안함
CREATE SEQUENCE like_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
Drop sequence like_seq;
-- 입력할 때
-- INSERT INTO LikeRest_Info(like_no, user_ID, rest_NO) VALUES(like_seq.NEXTVAL, '유저아이디값' , 'rest_NO값');

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
drop table Review_Info;
drop table Review_Info cascade constraints;
drop sequence review_seq;
select * from v$nls_parameters;


insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (1, 'a0001', 5, '테스트 리뷰', 1 , sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (2, 'a0001', 5, '테스트 리뷰2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (3, 'a0001', 5, '테스트 리뷰2', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (4, 'a0001', 4, '테스트 리뷰2', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (5, 'a0001', 5, '테스트 리뷰2', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (6, 'a0001', 6, '테스트 리뷰2', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (7, 'a0001', 7, '테스트 리뷰2', 7, sysdate);
    
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 5, '테스트 리뷰1', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 4, '테스트 리뷰2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '테스트 리뷰3', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 2, '테스트 리뷰4', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0001', 1, '테스트 리뷰5', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0002', 2, '테스트 리뷰6', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0003', 3, '테스트 리뷰7', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0004', 4, '테스트 리뷰8', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0005', 5, '테스트 리뷰9', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_date)
    values (review_seq.nextval, 'a0006', 5, '테스트 리뷰10', 4, sysdate);    
    
    drop SEQUENCE review_seq;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

CREATE TABLE ReviewIMG_Info (
    img_FileNO INT PRIMARY KEY,
    img_FileName VARCHAR2(50),
    review_NO INT,
    fileType varchar2 (50),
    rest_NO INT,
    CONSTRAINT FK_imgReview FOREIGN KEY (review_NO)
    REFERENCES Review_Info (review_NO)
    ON DELETE CASCADE
);
select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName, ri.rest_Scope, ri.rest_City
from Restaurant_Info ri where ri.rest_City = (select user_City from User_info where user_ID = 'a0006') order by rest_OpenDate;




select user_City from User_info where user_ID = 'a0006';

     commit;
CREATE SEQUENCE reviewIMG_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

drop sequence reviewIMG_seq;
drop table ReviewIMG_Info;

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'han.jpg', 1,'main_image', 1);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'kang.jpg', 2,'main_image', 2);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'lee.jpg', 4,'main_image', 4);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO,fileType, rest_NO)
values (reviewimg_seq.nextval, 'sam.jpg',5,'main_image', 5);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwa.jpg',6,'main_image', 6);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwakill.jpg',7,'main_image', 7);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'da.jpg',8,'main_image', 8);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'ryu.jpg', 9,'main_image', 9);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'inn.jpg', 10,'main_image', 10);
-----------------------------------------------------------------------------------
insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, '3ch.jpg', 11,'main_image', 11);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi2.jpeg', 12,'main_image',12);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'burger.jpeg', 13,'main_image', 13);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi3.jpeg', 14,'main_image', 14);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'kimbap.jpeg', 15,'main_image', 15);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi4.jpeg', 16,'main_image', 16);
commit;

insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate ,rest_City)
                      values(1,'han.jpg', '한미옥', '10만원대', '서울 강남구 봉은사로 319 한미옥', '02-1234-5678', '1', '인스타그램','K-Traditional',1, sysdate, '강남구');
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                      values(2,'kang.jpg', '강남한우정육식당', '10만원대', '서울 강남구 삼성로 546 1층 101호', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '파주시');
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                     values(3,'kill.jpg', '길목', '10만원대', '서울 강남구 영동대로129길 10 진성빌딩', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '강남구');     
                     
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(4,'lee.jpg', '리북집', '10만원대', '서울 강남구 학동로2길 45', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '강남구');
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                    values(5,'sam.jpg', '삼육가본점', '10만원대', '서울 강남구 강남대로114길 8', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '파주시');
                    
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                 values(6, 'hwa.jpg' , '화덕고깃간 ', '10만원대', '서울 강남구 테헤란로19길 17', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '강남구');
   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(7,'hwakill.jpg', '화기애애', '10만원대', '서울 강남구 강남대로106길 12 화기애애', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '파주시');  
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(8,'da.jpg', '다몽집', '10만원대', '서울 강남구 강남대로100길 13 2층 다몽집', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate, '강남구');
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(9,'ryu.jpg', '류몽민', '10만원대', '서울 강남구 학동로25길 11 씨플레이스 2층', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate,'강남구');
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(10,'inn.jpg', '경청애인', '10만원대', '서울 강남구 테헤란로 421 암천빌딩 3층', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate,'파주시' );
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate,rest_City)
                   values(11,'3ch.jpg', '3마리각색치킨', '3만원대', '경기 파주시 금촌동', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate,'파주시');


select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName, ri.rest_Scope 
from Restaurant_Info ri, User_Info ui where ri.rest_Address like '%시%' order by rest_OpenDate;

select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName, ri.rest_Scope 
from Restaurant_Info ri
LEFT JOIN User_Info ui ON ri.rest_Address LIKE '%'+ui.user_City+'%';

commit;
CREATE TABLE Tag_Info (
    tag_NO INT PRIMARY KEY,
    tag_Name VARCHAR(20)
);
CREATE SEQUENCE tag_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;

select ri.rest_NO, ri.rest_Name, ri.rest_Price, ri.rest_Address, ri.rest_fileName, ri.rest_Scope 
from Restaurant_Info ri, User_Info ui where ri.rest_City=ui.user_city order by rest_OpenDate;

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

-- 뷰 생성: 프로필정보+리뷰정보 매치 (디테일페이지 리뷰영역)
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

-- 뷰 생성: 리뷰정보+해당 리뷰이미지
CREATE view review_content_img as
select review.REVIEW_NO,
review.USER_ID,
review.REVIEW_SCOPE,
review.REVIEW_TEXT,
review.REST_NO,

review_img.IMAGES from review_info review left outer join review_img on review.review_no = review_img.review_no;
select * from  review_content_img;

drop view review_content_img;

--뷰 생성: 리뷰 번호 + 해당하는 리뷰이미지
create view review_img as
select review_no, listagg(img_filename, '/') within group(order by img_filename) as images from reviewimg_info group by review_no;
select * from review_img;

SELECT * FROM user_info;
SELECT * FROM restaurant_info;
SELECT * FROM likerest_info;
SELECT * FROM review_info;
SELECT * FROM reviewimg_info;
SELECT * FROM tag_info;
SELECT * FROM rest_tag;

DROP TABLE rest_tag;
DROP TABLE tag_info;
DROP TABLE reviewimg_info;
DROP TABLE review_info;
DROP TABLE likerest_info;
DROP TABLE restaurant_info;
DROP TABLE user_info;