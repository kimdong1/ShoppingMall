package kr.donguk.shop.vo;

import java.util.Date;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductVO {
	/*
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
	 */
	private int    product_idx;
	private String product_id;
	private String product_name;
	private String product_price;
	private String product_content;
	private Date   product_regdate;
	private String product_size;
	private String product_color;
	private String product_division;
	private String product_smallDivision;
	
}
