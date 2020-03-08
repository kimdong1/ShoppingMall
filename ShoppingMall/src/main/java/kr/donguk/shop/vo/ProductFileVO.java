package kr.donguk.shop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class ProductFileVO {
	private int file_idx;
	private String product_division;
	private String product_smallDivision;
	private int product_idx;
	private String product_id;
	private String product_ofile;
	private String product_sfile;
}
