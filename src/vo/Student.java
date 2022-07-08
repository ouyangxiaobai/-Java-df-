package vo;

public class Student {

	private String name = null;// 姓名
	private String password = null;// 登录密码
	private String phone = null;// 手机号
	private String sex = null;// 性别
	private String number = null;// 学号
	private String email = null;// 邮箱
	private String group = null;// 所属的组别
	private String sclass = null;// 所在的班级

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String tel) {
		this.phone = tel;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String no) {
		this.number = no;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGroup() {
		return group;
	}

	public void setGroup(String group) {
		this.group = group;
	}

	public String getSclass() {
		return sclass;
	}

	public void setSclass(String sclass) {
		this.sclass = sclass;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", password=" + password + ", phone=" + phone + ", sex=" + sex + ", number="
				+ number + ", email=" + email + ", group=" + group + ", sclass=" + sclass + "]";
	}
	
}
