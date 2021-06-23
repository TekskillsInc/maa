package com.tekskills.DTO;

import java.util.Date;
import java.util.List;

import com.tekskills.entity.ComplaintDetailsEntity;

public class complaintHistoryDto {

	private Integer userid;
	private String description;
	private String name;
	private String commentby;
	private String commentdate;
	private Integer compId;
	private Integer roleId;
	
	private ComplaintDetailsEntity complaints;
	
	private List<complaintHistoryDto> comphlist;

	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getCommentby() {
		return commentby;
	}
	public void setCommentby(String commentby) {
		this.commentby = commentby;
	}
	
	public Integer getCompId() {
		return compId;
	}
	public void setCompId(Integer compId) {
		this.compId = compId;
	}
	public ComplaintDetailsEntity getComplaints() {
		return complaints;
	}
	public void setComplaints(ComplaintDetailsEntity complaints) {
		this.complaints = complaints;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public List<complaintHistoryDto> getComphlist() {
		return comphlist;
	}
	public void setComphlist(List<complaintHistoryDto> comphlist) {
		this.comphlist = comphlist;
	}
	public String getCommentdate() {
		return commentdate;
	}
	public void setCommentdate(String commentdate) {
		this.commentdate = commentdate;
	}
	public Integer getRoleId() {
		return roleId;
	}
	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}
