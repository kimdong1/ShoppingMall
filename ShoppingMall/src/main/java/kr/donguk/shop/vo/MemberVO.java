package kr.donguk.shop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class MemberVO {
	/*
	`member_idx`       INT             NOT NULL    AUTO_INCREMENT COMMENT '고유번호', 
    `member_userid`    VARCHAR(100)    NOT NULL    COMMENT '아이디', 
    `member_password`  VARCHAR(255)    NOT NULL    COMMENT '비밀번호', 
    `member_name`      VARCHAR(45)     NOT NULL    COMMENT '이름', 
    `member_phone`     VARCHAR(11)     NOT NULL    COMMENT '핸드폰', 
    `member_regdate`   TIMESTAMP       NOT NULL    COMMENT '가입일', 
    `member_grade`     INT(1)          NOT NULL    COMMENT '등급', 
    `member_zipcode`   VARCHAR(10)     NOT NULL    COMMENT '지번', 
    `member_addr1`     VARCHAR(100)    NOT NULL    COMMENT '주소', 
    `member_addr2`     VARCHAR(100)    NOT NULL    COMMENT '상세주소', 
	 */
	
	private int    member_idx;
	private String member_userid;
	private String member_password;
	private String member_name;
	private String member_phone;
	private String member_regdate;
	private String member_grade;
	private String member_zipcode;
	private String member_addr1;
	private String member_addr2;
	
}
