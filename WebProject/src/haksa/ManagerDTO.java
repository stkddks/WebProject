package haksa;

import java.io.Serializable;

//import com.sun.org.apache.xml.internal.utils.ListingErrorHandler;

public class ManagerDTO implements Serializable {
	private int no;
	private String age;
	private String name;
	private String dept;
	public ManagerDTO() {
		super();
	}
	
	@Override
	public String toString() {
		return "StudentDTO [no=" + no + ", age=" + age + ", name=" + name + ", dept=" + dept + "]";
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}

}
