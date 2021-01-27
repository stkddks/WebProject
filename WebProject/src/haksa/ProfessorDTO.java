package haksa;

import java.io.Serializable;

public class ProfessorDTO extends HaksaDTO implements Serializable {
   private String subject;

   public ProfessorDTO() {
      super();
   }

   public ProfessorDTO(int no, String age, String name, String subject) {
      super(no, age, name);
      this.subject = subject;
   }

   public String getSubject() {
      return subject;
   }

   public void setSubject(String subject) {
      this.subject = subject;
   }

   @Override
   public String toString() {
      return super.toString() + "ProfessorDTO [subject=" + subject + "]";
   }

}