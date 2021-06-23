package com.tekskills.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name = "Maa_ClassifiedInformation")
public class ClassifiedInformation {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO, generator = "native")
	@GenericGenerator(name = "native", strategy = "native")
	@Column(name = "classified", updatable = false, nullable = false)
	
	int classified;
	
	@Column(name = "csfType")
	String csfType ; 
	
	
	@Column(name = "csfPrtytype")
	String	csfPrtytype ;
	
	@Column(name = "noofbaths")
	String	noofbaths;  
	
	@Column(name = "nofofparking")
	String	nofofparking; 
	
	
	@Column(name = "noofBeds")
	String	noofBeds;
	
	
	@Column(name = "areaSqft")
	String	  areaSqft  ;
	
	
	
	
	@Column(name = "facing")
	String	  facing ;
	
	@Column(name = "tags")
	String	  tags ;
	
	@Column(name = "csfstatus")
	String	  csfstatus ;
	
	@Column(name = "userid")
	int	  userid ;
	
		@Column(name = "prtyAddress")
			  String  prtyAddress ;
	
	@Column(name = "city")
	  String  city ;
	
	@Column(name = "state")
	  String  state ;
	
	@Column(name = "prtyid")
	int	prtyid  ;

	
	
	@Column(name = "csfTitle")
	  String  csfTitle ;
	
	@Column(name = "csfDesription")
	  String  csfDesription ;
	
	@Column(name = "gmapLink")
	  String  gmapLink ;
	@Column(name = "loanfacility")
	  String  loanfacility ;
	

	@Column(name = "prtyavialbleon")
	String prtyavialbleon ;
	 
	 @Column(name = "amount")
	  String  amount ;
	 @Column(name = "advance")
	  String  advance ;
	 
	

	@Column(name = "name")
	  String  name ;
	 
	 @Column(name = "email")
	  String  email ;
	 
	 @Column(name = "phone")
	  String  phone ;
	 
	 @Column(name = "status")
	  String   status ;
	 @Column(name = "postedon")
		String postedon ;
	 @Column(name = "updatedon")
		String updatedon ;
	 
	 
	 public int getClassified() {
			return classified;
		}

		public void setClassified(int classified) {
			this.classified = classified;
		}

		public String getCsfType() {
			return csfType;
		}

		public void setCsfType(String csfType) {
			this.csfType = csfType;
		}

		public String getCsfPrtytype() {
			return csfPrtytype;
		}

		public void setCsfPrtytype(String csfPrtytype) {
			this.csfPrtytype = csfPrtytype;
		}

		public String getNoofbaths() {
			return noofbaths;
		}

		public void setNoofbaths(String noofbaths) {
			this.noofbaths = noofbaths;
		}

		public String getNofofparking() {
			return nofofparking;
		}

		public void setNofofparking(String nofofparking) {
			this.nofofparking = nofofparking;
		}

		public String getNoofBeds() {
			return noofBeds;
		}

		public void setNoofBeds(String noofBeds) {
			this.noofBeds = noofBeds;
		}

		public String getAreaSqft() {
			return areaSqft;
		}

		public void setAreaSqft(String areaSqft) {
			this.areaSqft = areaSqft;
		}

		public String getFacing() {
			return facing;
		}

		public void setFacing(String facing) {
			this.facing = facing;
		}

		public String getPrtyAddress() {
			return prtyAddress;
		}

		public void setPrtyAddress(String prtyAddress) {
			this.prtyAddress = prtyAddress;
		}

		public String getCity() {
			return city;
		}

		public void setCity(String city) {
			this.city = city;
		}

		public String getState() {
			return state;
		}

		public void setState(String state) {
			this.state = state;
		}

		 public String getPostedon() {
				return postedon;
			}

			public void setPostedon(String postedon) {
				this.postedon = postedon;
			}

			public String getUpdatedon() {
				return updatedon;
			}

			public void setUpdatedon(String updatedon) {
				this.updatedon = updatedon;
			}

		public int getPrtyid() {
			return prtyid;
		}

		public void setPrtyid(int prtyid) {
			this.prtyid = prtyid;
		}

		public String getCsfTitle() {
			return csfTitle;
		}

		public void setCsfTitle(String csfTitle) {
			this.csfTitle = csfTitle;
		}

		public String getCsfDesription() {
			return csfDesription;
		}

		public void setCsfDesription(String csfDesription) {
			this.csfDesription = csfDesription;
		}

		public String getGmapLink() {
			return gmapLink;
		}
		public String getLoanfacility() {
			return loanfacility;
		}

		public void setLoanfacility(String loanfacility) {
			this.loanfacility = loanfacility;
		}
		public void setGmapLink(String gmapLink) {
			this.gmapLink = gmapLink;
		}

		public String getPrtyavialbleon() {
			return prtyavialbleon;
		}

		public void setPrtyavialbleon(String prtyavialbleon) {
			this.prtyavialbleon = prtyavialbleon;
		}

		public String getAmount() {
			return amount;
		}

		public void setAmount(String amount) {
			this.amount = amount;
		}

		public String getAdvance() {
			return advance;
		}

		public void setAdvance(String advance) {
			this.advance = advance;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		public String getPhone() {
			return phone;
		}

		public void setPhone(String phone) {
			this.phone = phone;
		}

		public String getStatus() {
			return status;
		}

		public void setStatus(String status) {
			this.status = status;
		}

		public int getUserid() {
			return userid;
		}

		public void setUserid(int userid) {
			this.userid = userid;
		}

		public String getCsfstatus() {
			return csfstatus;
		}

		public void setCsfstatus(String csfstatus) {
			this.csfstatus = csfstatus;
		}

		public String getTags() {
			return tags;
		}

		public void setTags(String tags) {
			this.tags = tags;
		}



}
