package com.tekskills.entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "maa_complaintHistory")
public class ComplaintHistoryEntity implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "tblpk", updatable = false, nullable = false)
	int tblpk;
	
	@Column(name = "commentgivenby")
	int commentgivenby;
		
	@Column(name = "description")
	String description;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "commentedDate")
	Date commentedDate;
	
	@Column(name = "complaintId")
	int complaintId;
	
	@Column(name = "roleid")
	int roleid;

	public int getRoleid() {
		return roleid;
	}

	public void setRoleid(int roleid) {
		this.roleid = roleid;
	}

	public int getTblpk() {
		return tblpk;
	}

	public void setTblpk(int tblpk) {
		this.tblpk = tblpk;
	}

	public int getCommentgivenby() {
		return commentgivenby;
	}

	public void setCommentgivenby(int commentgivenby) {
		this.commentgivenby = commentgivenby;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCommentedDate() {
		return commentedDate;
	}

	public void setCommentedDate(Date commentedDate) {
		this.commentedDate = commentedDate;
	}

	public int getComplaintId() {
		return complaintId;
	}

	public void setComplaintId(int complaintId) {
		this.complaintId = complaintId;
	}
	
}
