package com.jt.manage.pojo;

import javax.persistence.Table;

import com.jt.common.po.BasePojo;

@Table(name="tb_item_desc")
public class ItemDesc extends BasePojo{
	
	//应该和item一对一关联
	private Long itemId;
	private String itemDesc;
	
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public String getItemDesc() {
		return itemDesc;
	}
	public void setItemDesc(String itemDesc) {
		this.itemDesc = itemDesc;
	}
	
	
}
