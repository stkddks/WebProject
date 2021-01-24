package mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class GoogleAuthentication extends Authenticator {
   PasswordAuthentication passAuth;
    
    public GoogleAuthentication(){
        passAuth = new PasswordAuthentication("stkddks", "ayroalaajgmtmkhv");
    }
 
    public PasswordAuthentication getPasswordAuthentication() {
        return passAuth;
    }
}