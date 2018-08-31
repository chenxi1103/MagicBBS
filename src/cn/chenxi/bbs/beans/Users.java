package cn.chenxi.bbs.beans;

public class Users {
	private int id;
	private String account;
	private String nickName;
	private String pwd;
	private String email;
	private String phone;
	private String portrait;
	public String getPortrait() {
		return portrait;
	}
	public void setPortrait(String portait) {
		this.portrait= portait;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
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
	public Users(int id, String account, String nickName, String pwd, String email, String phone, String portrait) {
		super();
		this.id = id;
		this.account = account;
		this.nickName = nickName;
		this.pwd = pwd;
		this.email = email;
		this.phone = phone;
		this.portrait = portrait;
	}
	
	public Users() {
	}
	@Override
	public String toString() {
		return "Users [id=" + id + ", account=" + account + ", nickName=" + nickName + ", pwd=" + pwd + ", email="
				+ email + ", phone=" + phone + ", portrait="+ portrait + "]";
	}
}
