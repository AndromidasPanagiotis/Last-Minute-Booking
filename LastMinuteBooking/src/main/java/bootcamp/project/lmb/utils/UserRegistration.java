/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bootcamp.project.lmb.utils;

import bootcamp.project.lmb.model.Role;
import bootcamp.project.lmb.model.User;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author Panos
 */
public class UserRegistration {

    static Properties mailserverproperties;
    static Session mailsession;
    static MimeMessage mymailmessage;
    public static Base64.Encoder encoder = Base64.getEncoder();

    public static void sendEmail(String userEmail, String url) throws AddressException, MessagingException {
// Step1
//System.out.println("\n 1st ===> setup Mail Server Properties..");

        mailserverproperties = System.getProperties();
        mailserverproperties.put("mail.smtp.port", "587");
        mailserverproperties.put("mail.smtp.auth", "true");
        mailserverproperties.put("mail.smtp.starttls.enable", "true");
        // System.out.println("Mail Server Properties have been setup successfully..");

// Step2
//System.out.println("\n\n 2nd ===> get Mail Session..");

        mailsession = Session.getInstance(mailserverproperties, null);
        //System.out.println("Mail Session has been created successfully..");

// Create mail object
        mymailmessage = new MimeMessage(mailsession);
        mymailmessage.addRecipient(Message.RecipientType.TO, new InternetAddress(userEmail));
        mymailmessage.setSubject("Confirmation of registration required");

// Object to hold the parts of the body
        Multipart multipart = new MimeMultipart();
// This class represents a MIME body part. It implements the BodyPart 
// abstract class and the MimePart interface. 
// MimeBodyParts are contained in MimeMultipart objects. 
// One part for attachment
        //MimeBodyPart mimeBodyPartForAttachment = new MimeBodyPart();
// One part for text
        MimeBodyPart mimeBodyPartforBody = new MimeBodyPart();
        //File attachment = new File("D:\\file.txt");
//        try {
//            mimeBodyPartForAttachment.attachFile(attachment);
//        } catch (IOException ex) {
//            Logger.getLogger(UserRegistration.class.getName()).log(Level.SEVERE, null, ex);
//        }
        String emailBody = "Confirm your registration to our website! Click here: " + url;
        mimeBodyPartforBody.setText(emailBody);
        multipart.addBodyPart(mimeBodyPartforBody);
        //multipart.addBodyPart(mimeBodyPartForAttachment);

        mymailmessage.setContent(multipart);

// Step3
//System.out.println("\n\n 3rd ===> Get Session and Send mail");
        Transport transport = mailsession.getTransport("smtp");

        transport.connect("smtp.gmail.com", "bootcampprojectLMB@gmail.com", "str0ngp@ss");
        transport.sendMessage(mymailmessage, mymailmessage.getAllRecipients());
        transport.close();
    }
    
    public static User registerUser(User newUser, ArrayList <Role> roles, String roleCheck) throws MessagingException {
        newUser.setPassword(new String(encoder.encode(newUser.getPassword().getBytes())));
        if(roleCheck.equals("owner")) {
            newUser.setRole(roles.get(1));
        }
        else {
            newUser.setRole(roles.get(0));
        }
        newUser.setSerial(new String(encoder.encode(newUser.getUsername().getBytes())));
        newUser.setActive(0);
        UserRegistration.sendEmail(newUser.getEmail(), "http://localhost:8080/lmb/user/confirmreg/" + newUser.getSerial());
        return newUser;
         
    }
}
