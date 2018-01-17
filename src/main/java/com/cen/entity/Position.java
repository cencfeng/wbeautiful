package com.cen.entity;

import java.io.Serializable;

public class Position implements Serializable{

	private int position_id;
	private String position;
	private String position_remark;
	public int getPosition_id() {
		return position_id;
	}
	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPosition_remark() {
		return position_remark;
	}
	public void setPosition_remark(String position_remark) {
		this.position_remark = position_remark;
	}
	
	
}
