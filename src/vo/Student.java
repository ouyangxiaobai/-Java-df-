package vo;

public class Student {

	private String name = null;// ����
	private String password = null;// ��¼����
	private String phone = null;// �ֻ���
	private String sex = null;// �Ա�
	private String number = null;// ѧ��
	private String email = null;// ����
	private String group = null;// ���������
	private String sclass = null;// ���ڵİ༶

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
