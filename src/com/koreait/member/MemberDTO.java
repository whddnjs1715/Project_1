package com.koreait.member;

public class MemberDTO {
	private int mem_idx;
	private String username;
	private String userpw;
	private String ssn1;
	private String ssn2;
	private String hp;
	private String email;
	private String emailHash;
	private String emailcheck;
	private String profilePic;
	private String dealPic;
	
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUserpw() {
		return userpw;
	}
	public void setUserpw(String userpw) {
		this.userpw = userpw;
	}
	public String getSsn1() {
		return ssn1;
	}
	public void setSsn1(String ssn1) {
		this.ssn1 = ssn1;
	}
	public String getSsn2() {
		return ssn2;
	}
	public void setSsn2(String ssn2) {
		this.ssn2 = ssn2;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmailHash() {
		return emailHash;
	}
	public void setEmailHash(String emailHash) {
		this.emailHash = emailHash;
	}
	public String getEmailcheck() {
		return emailcheck;
	}
	public void setEmailcheck(String emailcheck) {
		this.emailcheck = emailcheck;
	}
	public String getProfilePic() {
		return profilePic;
	}
	public void setProfilePic(String profilePic) {
		this.profilePic = profilePic;
	}
	public String getDealPic() {
		return dealPic;
	}
	public void setDealPic(String dealPic) {
		this.dealPic = dealPic;
	}
	
	
}
