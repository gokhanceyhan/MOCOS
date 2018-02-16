/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.solver;

import com.solver.dataTypes.Constants;
import com.solver.dataTypes.Protocol;
import java.util.Date;
import java.util.Properties;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.Authenticator;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 *
 * @author moco
 */
public class EmailSender {

    private final int port = 587;
    private final String host = "mail.onlinemoco.com";
    private final String from = "info@onlinemoco.com";
    private final boolean auth = true;
    private final String username = "info@onlinemoco.com";
    private final String password = "Mocomail_1";
    private final Protocol protocol = Protocol.SMTP;
    private final boolean debug = true;

    public EmailSender() {

    }

    public void sendEmail(String to, long jobId) {
        Properties props = new Properties();
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        switch (protocol) {
            case SMTPS:
                props.put("mail.smtp.ssl.enable", true);
                break;
            case TLS:
                props.put("mail.smtp.starttls.enable", true);
                break;
        }
        Authenticator authenticator = null;
        if (auth) {
            props.put("mail.smtp.auth", true);
            authenticator = new Authenticator() {
                private final PasswordAuthentication pa = new PasswordAuthentication(username, password);

                @Override
                public PasswordAuthentication getPasswordAuthentication() {
                    return pa;
                }
            };
        }
        Session session = Session.getInstance(props, authenticator);
        session.setDebug(debug);

        MimeMessage message = new MimeMessage(session);
        try {
            message.setFrom(new InternetAddress(from));
            InternetAddress[] address = {new InternetAddress(to)};
            message.setRecipients(Message.RecipientType.TO, address);
            message.setSubject("Results for job " + jobId);
            message.setSentDate(new Date());

            // Create the message part 
            BodyPart messageBodyPart = new MimeBodyPart();

            // Fill the message
            messageBodyPart.setText("The job has been completed! See the attachments.\n");

            // Create a multipar message
            Multipart multipart = new MimeMultipart();

            // Set text message part
            multipart.addBodyPart(messageBodyPart);

            // Part two is attachment
            messageBodyPart = new MimeBodyPart();
            String filename = "results.txt";
            DataSource source = new FileDataSource(Constants.JOBS_PATH + to + "/" + jobId + "/" + "Output_nd_points.txt");
            messageBodyPart.setDataHandler(new DataHandler(source));
            messageBodyPart.setFileName(filename);
            multipart.addBodyPart(messageBodyPart);
            
            BodyPart attachment2 = new MimeBodyPart();
            String modelFileName = "model.lp";
            DataSource modelFile = new FileDataSource(Constants.JOBS_PATH + to + "/" + jobId + "/" + "model.lp");
            attachment2.setDataHandler(new DataHandler(modelFile));
            attachment2.setFileName(modelFileName);
            multipart.addBodyPart(attachment2);

            // Send the complete message parts
            message.setContent(multipart);

            Transport.send(message);
        } catch (MessagingException ex) {
            ex.printStackTrace();
        }
    }

}
