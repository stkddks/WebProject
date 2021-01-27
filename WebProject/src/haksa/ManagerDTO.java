package haksa;

import java.io.Serializable;

public class ManagerDTO extends HaksaDTO implements Serializable, ManagerInterfaceDTO {
   private String dept;

   public ManagerDTO() {
      super();
   }

   public ManagerDTO(int no, String age, String name, String dept) {
      super(no, age, name);
      this.dept = dept;
   }
   @Override
   public String getDept() {
      return dept;
   }
   @Override
   public void setDept(String dept) {
      this.dept = dept;
   }

   @Override
   public String toString() {
      return super.toString() + "ManagerDTO [dept=" + dept + "]";
   }

}