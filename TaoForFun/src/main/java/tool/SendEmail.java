package tool;

import java.util.Date;  
import java.util.Properties;  
  
import javax.mail.Authenticator;  
import javax.mail.Message;  
import javax.mail.MessagingException;  
import javax.mail.PasswordAuthentication;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeMessage;  
  
public class SendEmail {  
      
//    public static final String HOST = "smtp.163.com";  
//    public static final String PROTOCOL = "smtp";     
//    public static final int PORT = 25;  
//    public static final String FROM = "taoforfun@163.com";//发件人的email  
//    public static final String PWD = "123456root";//发件人密码  （客户端授权密码 原始密码root123456）
//    
//    /** 
//     * 获取Session 
//     * @return 
//     */  
//    private static Session getSession() {  
//        Properties props = new Properties();  
//        props.put("mail.smtp.host", HOST);//设置服务器地址  
//        props.put("mail.store.protocol" , PROTOCOL);//设置协议  
//        props.put("mail.smtp.port", PORT);//设置端口  
//        props.put("mail.smtp.auth" , false);  
//          
//        Authenticator authenticator = new Authenticator() {  
//  
//            @Override  
//            protected PasswordAuthentication getPasswordAuthentication() {  
//                return new PasswordAuthentication(FROM, PWD);  
//            }  
//              
//        };  
//        Session session = Session.getDefaultInstance(props , authenticator);  
//          
//        return session;  
//    }  
      
    public static void send(String toEmail , String content) {  
        String from = "taoforfun@163.com";
        final String userName = "taoforfun";
        final String password = "123456root";
        String host = "smtp.163.com";
        
        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "25");
        
        Session session = Session.getInstance(props, new Authenticator() {
        	   protected PasswordAuthentication getPasswordAuthentication() {
        		   return new PasswordAuthentication(userName, password);
        	   }
        });
        
        try {  
            System.out.println("--send--"+content);  
            // Instantiate a message  
            Message msg = new MimeMessage(session);  
   
            //Set message attributes  
            msg.setFrom(new InternetAddress(from));  
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toEmail));  
            msg.setSubject("账号激活邮件");  
            msg.setSentDate(new Date());  
            msg.setContent(content , "text/html;charset=utf-8");  
   
            //Send the message  
            Transport.send(msg);  
            System.out.println("发送成功");
        }  
        catch (MessagingException mex) {  
            mex.printStackTrace();  
        }  
    }  
  
}  