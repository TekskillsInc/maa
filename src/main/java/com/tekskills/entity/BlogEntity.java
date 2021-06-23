package com.tekskills.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name = "Maa_Blogs")
public class BlogEntity implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)

	@Column(name = "blogid", updatable = false, nullable = false)

	private int blogid;
	@Column(name = "Title")
	private String title;
	@Column(name = "description")
	private String description;
	
	
	
	@Column(name = "image")
	private String image;

	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	@Column(name = "Tags")
	String tags;
	public int getBlogid() {
		return blogid;
	}
	public void setBlogid(int blogid) {
		this.blogid = blogid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getTags() {
		return tags;
	}
	public void setTags(String tags) {
		this.tags = tags;
	}
	public String getPostedby() {
		return postedby;
	}
	public void setPostedby(String postedby) {
		this.postedby = postedby;
	}
	public String getPostedon() {
		return postedon;
	}
	public void setPostedon(String postedon) {
		this.postedon = postedon;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Column(name = "postedby")
	String postedby;
	@Column(name = "postedon")
	String postedon;
	

}
