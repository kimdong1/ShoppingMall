package kr.donguk.shop.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class CategoryVO {
	private int category_idx;
	private int category_lev;
	private int category_grp;
	private String category_title;

}
