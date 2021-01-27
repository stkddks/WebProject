package haksa;

public abstract class HaksaDTO {
private int no;
private String age;
private String name;
public HaksaDTO(int no, String age, String name) {
   super();
   this.no = no;
   this.name = name;
   this.age = age;
}

public HaksaDTO() {
   super();
   // TODO Auto-generated constructor stub
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

//public abstract String getHakbuun;
//


@Override
public String toString() {
   return "HaksaDTO [no=" + no + ", age=" + age + ", name=" + name + "]";
}
}