package com.koreait.mail;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class Gmail extends Authenticator{

	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication("whddnjs1715@gmail.com", "Whdsksl8866955!");
	}
}
