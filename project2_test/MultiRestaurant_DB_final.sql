-- 테이블 생성
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

CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(50) NOT NULL,
    rest_Price VARCHAR2(50) NOT NULL,
    rest_Address VARCHAR2(100) NOT NULL,
    rest_Phone varchar2(30),
    rest_Scope INT,
    rest_Social VARCHAR2(50),
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

CREATE TABLE Tag_Info (
    tag_NO INT PRIMARY KEY,
    tag_Name VARCHAR(20)
);

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


-- 시퀀스 생성
CREATE SEQUENCE like_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE review_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE reviewIMG_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;
CREATE SEQUENCE tag_seq START WITH 1 INCREMENT BY 1 MAXVALUE 9999 NOCYCLE NOCACHE;


-- 뷰 생성 (순서 중요)
create view review_img as
select review_no, listagg(img_filename, '/') within group(order by img_filename) as images from reviewimg_info group by review_no;

CREATE view review_content_img as
select review.REVIEW_NO,
review.USER_ID,
review.REVIEW_SCOPE,
review.REVIEW_TEXT,
review.REST_NO,
review.review_date,
review_img.IMAGES from review_info review left outer join review_img on review.review_no = review_img.review_no;

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


-- insert: user_info
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0001', 'a0001', '테스트이름1', '1991', 1, '강남', 'a0001@gmail.com', '01000000000', 1, 'pizza.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0002', 'a0002', '테스트이름2', '1992', 2, '강남', 'a0002@gmail.com', '02000000000', 2, 'pasta.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0003', 'a0003', '테스트이름3', '1993', 1, '파주', 'a0003@gmail.com', '03000000000', 1, 'sushi.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0004', 'a0004', '테스트이름4', '1994', 2, '파주', 'a0004@gmail.com', '04000000000', 2);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level) 
    values ('a0005', 'a0005', '테스트이름5', '1995', 1, '여의도', 'a0005@gmail.com', '05000000000', 1);
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0006', 'a0006', '테스트이름6', '1996', 2, '파주', 'a0006@gmail.com', '06000000000', 2, 'sushi2.jpg');
insert into user_info(user_ID, user_PW, user_Nickname, user_Birth, user_gender, user_City, user_Email, user_Phone, user_level, user_profile) 
    values ('a0007', 'a0007', '테스트이름7', '1997', 1, '강남', 'a0007@gmail.com', '07000000000', 2, 'burger.jpg');


-- insert: restaurant_info
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                      values(1,'han.jpg', '한미옥', '10만원대', '서울 강남구 봉은사로 319 한미옥', '02-1234-5678', 1, '인스타그램','K-Traditional',1, sysdate);
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                      values(2,'kang.jpg', '강남한우정육식당', '10만원대', '서울 강남구 삼성로 546 1층 101호', '02-1234-5678', 2, '인스타그램','Meat',1, sysdate);
                      
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                     values(3,'kill.jpg', '길목', '10만원대', '서울 강남구 영동대로129길 10 진성빌딩', '02-1234-5678', 3, '인스타그램','Meat',1, sysdate);     
                     
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                   values(4,'lee.jpg', '리북집', '10만원대', '서울 강남구 학동로2길 45', '02-1234-5678', 4, '인스타그램','Meat',1, sysdate);
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                    values(5,'sam.jpg', '삼육가본점', '10만원대', '서울 강남구 강남대로114길 8', '02-1234-5678', 5, '인스타그램','Meat',1, sysdate);
                    
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                 values(6,'hwa .jpg', '화덕고깃간 ', '10만원대', '서울 강남구 테헤란로19길 17', '02-1234-5678', 4, '인스타그램','Meat',1, sysdate);
                 
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                   values(7,'hwakill.jpg', '화기애애', '10만원대', '서울 강남구 강남대로106길 12 화기애애', '02-1234-5678', 3, '인스타그램','Meat',1, sysdate);  
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                   values(8,'da.jpg', '다몽집', '10만원대', '서울 강남구 강남대로100길 13 2층 다몽집', '02-1234-5678', 2, '인스타그램','Meat',1, sysdate);
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                   values(9,'ryu.jpg', '류몽민', '10만원대', '서울 강남구 학동로25길 11 씨플레이스 2층', '02-1234-5678', 1, '인스타그램','Meat',1, sysdate);
                   
insert into restaurant_info (rest_NO,rest_filename, rest_Name, rest_Price, rest_Address, rest_Phone, rest_Scope, rest_Social,rest_theme,rest_View, rest_OpenDate)
                   values(10,'inn.jpg', '경청애인', '10만원대', '서울 강남구 테헤란로 421 암천빌딩 3층', '02-1234-5678', '1', '인스타그램','Meat',1, sysdate);


-- insert: review_info
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0001', 1, '테스트 리뷰', 1, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0002', 2, '테스트 리뷰2', 2, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0003', 3, '테스트 리뷰3', 3, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0004', 4, '테스트 리뷰4', 4, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0005', 5, '테스트 리뷰5', 5, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0006', 4, '테스트 리뷰6', 6, sysdate);
insert into review_info(review_NO, user_ID, review_scope, review_Text, rest_NO, review_Date)
    values (review_seq.nextval, 'a0007', 3, '테스트 리뷰7', 7, sysdate);



-- insert: reviewimg_info
insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'han.jpg', 1,'main_image', 1);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'kang.jpg', 2,'main_image', 2);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO) 
values (reviewimg_seq.nextval, 'lee.jpg', 3,'main_image', 3);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO,fileType, rest_NO)
values (reviewimg_seq.nextval, 'sam.jpg',4,'main_image', 4);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwa.jpg',5,'main_image', 5);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'hwakill.jpg',6,'main_image', 6);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'da.jpg',7,'main_image', 7);


insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi2.jpg', 1,'main_image',1);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'burger.jpg', 2,'main_image', 2);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi3.jpg', 3,'main_image', 3);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'kimbap.jpg', 4,'main_image', 4);

insert into reviewimg_info (img_fileNo, img_fileName, review_NO, fileType, rest_NO)
values (reviewimg_seq.nextval, 'sushi4.jpg', 5,'main_image', 5);


-- commit
commit;


-- !! 셀렉트 !!
SELECT * FROM user_info;
SELECT * FROM restaurant_info;
SELECT * FROM likerest_info;
SELECT * FROM review_info;
SELECT * FROM reviewimg_info;
SELECT * FROM tag_info;
SELECT * FROM rest_tag;

select * from review_img;
select * from  review_content_img;
select * from profile_review;
-- !! 셀렉트 !!


--!! 드롭입니다 !!
DROP TABLE rest_tag;
DROP TABLE tag_info;
DROP TABLE reviewimg_info;
DROP TABLE review_info;
DROP TABLE likerest_info;
DROP TABLE restaurant_info;
DROP TABLE user_info;
-- !!드롭입니다 !!
drop sequence reviewIMG_seq;
drop sequence like_seq;
drop sequence review_seq;
drop sequence tag_seq;
-- !!드롭입니다 !!
drop view review_img;
drop view review_content_img;
drop view profile_review;
-- !! 드롭입니다 !!
