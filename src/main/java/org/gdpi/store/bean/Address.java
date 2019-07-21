package org.gdpi.store.bean;

public class Address {
	private int id;//��ַid
	private int userId;//�û�id
	private String consignee;//�ռ���
	private String phone;//�ֻ�
	private String fixedPhone;//����
	private String postalCode;//�ʱ�
	private String areaCode;//��
	private String citieCode;//��
	private String provinceCode;//ʡ
	private String detailed;//��ϸ��ַ
	private String addressName;//��ַ����
	private int state;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public String getConsignee() {
		return consignee;
	}
	public void setConsignee(String consignee) {
		this.consignee = consignee;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getFixedPhone() {
		return fixedPhone;
	}
	public void setFixedPhone(String fixedPhone) {
		this.fixedPhone = fixedPhone;
	}
	public String getPostalCode() {
		return postalCode;
	}
	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}
	public String getAreaCode() {
		return areaCode;
	}
	public void setAreaCode(String areaCode) {
		this.areaCode = areaCode;
	}
	public String getCitieCode() {
		return citieCode;
	}
	public void setCitieCode(String citieCode) {
		this.citieCode = citieCode;
	}
	public String getProvinceCode() {
		return provinceCode;
	}
	public void setProvinceCode(String provinceCode) {
		this.provinceCode = provinceCode;
	}
	public String getDetailed() {
		return detailed;
	}
	public void setDetailed(String detailed) {
		this.detailed = detailed;
	}
	public String getAddressName() {
		return addressName;
	}
	public void setAddressName(String addressName) {
		this.addressName = addressName;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "Address [id=" + id + ", userId=" + userId + ", consignee=" + consignee + ", phone=" + phone
				+ ", fixedPhone=" + fixedPhone + ", postalCode=" + postalCode + ", areaCode=" + areaCode
				+ ", citieCode=" + citieCode + ", provinceCode=" + provinceCode + ", detailed=" + detailed
				+ ", addressName=" + addressName + ", state=" + state + "]";
	}
}
