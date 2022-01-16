CREATE TABLE User_Info(
    user_ID VARCHAR2(20) PRIMARY KEY,
    user_PW VARCHAR2(20) NOT NULL,
    user_Nickname VARCHAR2(20) DEFAULT '회원',
    user_Birth INT,
    user_gender INT,
    user_City VARCHAR2(20),
    user_Email VARCHAR2(20),
    user_Phone INT,
    user_level INT DEFAULT 1,
    user_profile VARCHAR2(50)
);

CREATE TABLE Restaurant_Info (
    rest_NO INT PRIMARY KEY,
    rest_Name VARCHAR2(20) NOT NULL,
    rest_Price VARCHAR2(20) NOT NULL,
    rest_Address VARCHAR2(20) NOT NULL,
    rest_Phone INT,
    rest_Scope INT,
    rest_Sosial VARCHAR2(20),
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