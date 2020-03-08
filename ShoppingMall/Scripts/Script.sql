CREATE TABLE UKshop_member
(
    `member_idx`       INT             NOT NULL    AUTO_INCREMENT COMMENT '고유번호', 
    `member_userid`    VARCHAR(100)    NOT NULL    COMMENT '아이디', 
    `member_password`  VARCHAR(100)    NOT NULL    COMMENT '비밀번호', 
    `member_name`      VARCHAR(45)     NOT NULL    COMMENT '이름', 
    `member_phone`     VARCHAR(11)     NOT NULL    COMMENT '핸드폰', 
    `member_regdate`   TIMESTAMP       NOT NULL    COMMENT '가입일', 
    `member_grade`     INT(1)          NOT NULL    COMMENT '등급', 
    `member_zipcode`   VARCHAR(10)     NOT NULL    COMMENT '지번', 
    `member_addr1`     VARCHAR(100)    NOT NULL    COMMENT '주소', 
    `member_addr2`     VARCHAR(100)    NOT NULL    COMMENT '상세주소', 
    PRIMARY KEY (member_idx)
);
update UKshop_member set member_grade=9 where member_userid='slasnrndu@gmail.com';
CREATE TABLE UKshop_category
(
    `category_idx`    INT            NOT NULL    AUTO_INCREMENT COMMENT '카테고리 고유번호', 
    `category_lev`    INT(1)         NULL        default 0 COMMENT '카테고리 레벨', 
    `category_grp`    INT            NOT NULL    default 0 COMMENT '카테고리 그룹', 
    `category_title`  VARCHAR(100)    NOT NULL    COMMENT '카테고리 제목', 
    PRIMARY KEY (category_idx)
);
drop table ukshop_category;
select * from UKshop_category;
insert into UKshop_category (category_title) values ("테스트");

insert into UKshop_category (category_lev,category_grp,category_title) values (1,3,'청바지');
select * from UKshop_category where category_lev=0 order by category_idx desc;
select max(category_grp) from UKshop_category;
select ifnull(max(category_grp),0) from UKshop_category;
select * from UKshop_category where category_lev=1 order by category_idx desc;
select * from UKshop_category where category_lev=0 order by category_idx desc;



select * from UKshop_category order by category_grp desc,category_lev;
select * from UKshop_category where category_grp=1 and category_lev=1 order by category_grp desc,category_lev;


CREATE TABLE UKshop_product
(
    `product_idx`      INT	 		   NOT NULL    auto_increment COMMENT '상품고유번호', 
    `product_id`       VARCHAR(300)    NOT NULL    COMMENT '상품아이디', 
    `product_name`     VARCHAR(300)    NOT NULL    COMMENT '상품이름', 
    `product_price`    VARCHAR(100)    NOT NULL    COMMENT '상품가격', 
    `product_content`  TEXT            NOT NULL    COMMENT '상품내용', 
    `product_regdate`  TIMESTAMP       NOT NULL    COMMENT '상품등록일', 
    `product_size`     varchar(10)     NOT NULL    COMMENT '상품사이즈', 
    `product_color`    VARCHAR(45)     NOT NULL    COMMENT '상품컬러', 
    `product_division`    VARCHAR(45)  NOT NULL    COMMENT '상품구분', 
    `product_smallDivision`    VARCHAR(45)  	   COMMENT '상품소구분', 
    PRIMARY KEY (product_idx,product_id),unique(product_id)
);
drop table UKshop_product;
select * from UKshop_product;

CREATE TABLE UKshop_product_file
(
    `file_idx`       INT             NOT NULL    AUTO_INCREMENT COMMENT '고유번호', 
    `product_division`    VARCHAR(45)  NOT NULL    COMMENT '상품구분', 
    `product_smallDivision`    VARCHAR(45)  	   COMMENT '상품 소구분', 
    `product_idx`     int    NOT NULL    COMMENT '참조번호', 
    `product_id`     VARCHAR(300)    NOT NULL    COMMENT '참조상품아이디', 
    `product_ofile`  TEXT            NOT NULL    COMMENT '실제 파일이름', 
    `product_sfile`  TEXT            NOT NULL    COMMENT '저장된 파일이름', 
    PRIMARY KEY (file_idx,product_id,product_idx)
);
drop table UKshop_product_file;
select * from UKshop_product_file;

select ifnull(max(category_grp),0) from UKshop_category;
select * from ukshop_category;

select * from UKshop_product 
				where product_name='나이키 어댑트 BB(Adapt BB)' and product_id='AO2582-001'
			order by product_idx desc;
