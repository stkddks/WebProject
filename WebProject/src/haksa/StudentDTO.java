package haksa;

import java.io.Serializable;

public class StudentDTO extends HaksaDTO implements Serializable,StudentInterfaceDTO {
   private String hakbun;

   public StudentDTO() {
      super();
   }

   public StudentDTO(int no, String age, String name, String hakbun) {
      super(no, age, name);
      this.hakbun = hakbun;
   }
   @Override
   public String getHakbun() {
      return hakbun;
   }
   @Override
   public void setHakbun(String hakbun) {
      this.hakbun = hakbun;
   }

   @Override
   public String toString() {
      return super.toString() + "StudentDTO [hakbun=" + hakbun + "]";
   }

}