package Services;



import Model.JavaBeanRegistration;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;
import java.util.Random;
import java.util.ResourceBundle;

public class Email {
    public String getRandom() {

        Random num = new Random();

        int number = num.nextInt(999999);
        return String.format("%06d", number);


    }

    public static boolean sendEmail(JavaBeanRegistration user) throws MessagingException {

        System.out.println("Preparing to send Message");
        String message = "Please verify your account -" + user.getCode();
        String subject = "Rahul : Confirmation ";
        String to = user.getUsername();
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        System.out.println("PROPERTIES" + properties);
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", 465);
        properties.put("mail.smtp.ssl.enable", true);
        properties.put("mail.smtp.auth", true);
        final String[] userName = {""};
        final String[] password = {""};

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                ResourceBundle resourceBundle = ResourceBundle.getBundle("Email");
                userName[0] = resourceBundle.getString("userName");
                password[0] = resourceBundle.getString("password");

                return new PasswordAuthentication(userName[0], password[0]);
            }
        });

        session.setDebug(true);

        MimeMessage mimeMessage = new MimeMessage(session);

        try {
            mimeMessage.setFrom(userName[0]);
            mimeMessage.addRecipients(Message.RecipientType.TO, String.valueOf(new InternetAddress(to)));
            mimeMessage.setSubject(subject);
            mimeMessage.setText(message);
            Transport.send(mimeMessage);
            System.out.println("Sent success");
            return true;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        System.out.println("Sent false");
        return false;
    }
}
