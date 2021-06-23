package com.tekskills.DTO;


public class AssetDetailsDto {
	
	private int assetid;

	private int prtyid; 

	private int userid; 

	private String flatno; 

	private int asttype;

	private int prtytax;

	private int areasqft;

	private int rent;

	private int maintenance;

	private int secBill;

	private String curmeterno;

	private String watermeter;

	private String desselmeter;

	private String acmeter;

	private String gasmeter;

	private String othMeter;
	
	int ownerid;
	
	int tenantId;
	
	String occ_by;
	
	int status;

	public int getTenantId() {
		return tenantId;
	}

	public void setTenantId(int tenantId) {
		this.tenantId = tenantId;
	}

	public int getUserid() {
		return userid;
	}

	public void setUserid(int userid) {
		this.userid = userid;
	}

	public int getOwnerid() {
		return ownerid;
	}

	public void setOwnerid(int ownerid) {
		this.ownerid = ownerid;
	}

	public String getOcc_by() {
		return occ_by;
	}

	public void setOcc_by(String occ_by) {
		this.occ_by = occ_by;
	}

	

	public int getAssetid() {
		return assetid;
	}

	public void setAssetid(int assetid) {
		this.assetid = assetid;
	}

	public int getPrtyid() {
		return prtyid;
	}

	public void setPrtyid(int prtyid) {
		this.prtyid = prtyid;
	}

	public int getUserd() {
		return userid;
	}

	public void setUserd(int userd) {
		this.userid = userd;
	}

	public String getFlatno() {
		return flatno;
	}

	public void setFlatno(String flatno) {
		this.flatno = flatno;
	}

	public int getAsttype() {
		return asttype;
	}

	public void setAsttype(int asttype) {
		this.asttype = asttype;
	}

	public int getPrtytax() {
		return prtytax;
	}

	public void setPrtytax(int prtytax) {
		this.prtytax = prtytax;
	}

	public int getAreasqft() {
		return areasqft;
	}

	public void setAreasqft(int areasqft) {
		this.areasqft = areasqft;
	}

	public int getRent() {
		return rent;
	}

	public void setRent(int rent) {
		this.rent = rent;
	}

	public int getMaintenance() {
		return maintenance;
	}

	public void setMaintenance(int maintenance) {
		this.maintenance = maintenance;
	}

	public int getSecBill() {
		return secBill;
	}

	public void setSecBill(int secBill) {
		this.secBill = secBill;
	}

	public String getCurmeterno() {
		return curmeterno;
	}

	public void setCurmeterno(String curmeterno) {
		this.curmeterno = curmeterno;
	}

	public String getWatermeter() {
		return watermeter;
	}

	public void setWatermeter(String watermeter) {
		this.watermeter = watermeter;
	}

	public String getDesselmeter() {
		return desselmeter;
	}

	public void setDesselmeter(String desselmeter) {
		this.desselmeter = desselmeter;
	}

	public String getAcmeter() {
		return acmeter;
	}

	public void setAcmeter(String acmeter) {
		this.acmeter = acmeter;
	}

	public String getGasmeter() {
		return gasmeter;
	}

	public void setGasmeter(String gasmeter) {
		this.gasmeter = gasmeter;
	}

	public String getOthMeter() {
		return othMeter;
	}

	public void setOthMeter(String othMeter) {
		this.othMeter = othMeter;
	}

	
	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	/*private AssetDetails asset;

	public AssetDetails getAsset() {
		return asset;
	}

	public void setAsset(AssetDetails asset) {
		this.asset = asset;
	}
*/
}
