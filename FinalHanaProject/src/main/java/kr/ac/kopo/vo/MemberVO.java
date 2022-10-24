package kr.ac.kopo.vo;

import javax.validation.constraints.NotEmpty;

import org.apache.ibatis.type.Alias;

@Alias("memberVO")
public class MemberVO {
	
	private int memberNum;
	private String identity;
	private String name;
	private String phoneNumber;
	private String address;
	private String domesticStatus;
	private String userType;
	private String gender;
	private String resDate;
	
	@NotEmpty(message="필수 입력사항입니다")
	private String emailAddress;
	
	@NotEmpty(message="필수 입력사항입니다")
	private String password;

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public String getIdentity() {
		return identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getEmailAddress() {
		return emailAddress;
	}

	public void setEmailAddress(String emailAddress) {
		this.emailAddress = emailAddress;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDomesticStatus() {
		return domesticStatus;
	}

	public void setDomesticStatus(String domesticStatus) {
		this.domesticStatus = domesticStatus;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getResDate() {
		return resDate;
	}

	public void setResDate(String resDate) {
		this.resDate = resDate;
	}

	public String getEmailAdress() {
		return emailAddress;
	}

	public void setEmailAdress(String emailAdress) {
		this.emailAddress = emailAdress;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "MemberVO [memberNum=" + memberNum + ", identity=" + identity + ", name=" + name + ", phoneNumber="
				+ phoneNumber + ", address=" + address + ", domesticStatus=" + domesticStatus + ", userType=" + userType
				+ ", gender=" + gender + ", resDate=" + resDate + ", emailAddress=" + emailAddress + ", password="
				+ password + "]";
	}
	
	
	
	
}
