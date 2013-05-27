/*package com.template.action;

import javax.jms.Connection;
import javax.jms.ConnectionFactory;
import javax.jms.Destination;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.MessageProducer;
import javax.jms.Session;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

public class JMSTest {
	
	
	
	
	public void test(){
		try {
		    InitialContext initCtx = new InitialContext();
		    Context envContext = (Context) initCtx.lookup("java:comp/env");
		    ConnectionFactory connectionFactory = (ConnectionFactory) envContext.lookup("jms/ConnectionFactory");
		    Connection connection = connectionFactory.createConnection();
		    Session session = connection.createSession(false, Session.AUTO_ACKNOWLEDGE);
		    MessageProducer producer = session.createProducer((Destination) envContext.lookup("jms/topic/MyTopic"));

		    Message testMessage = session.createMessage();
		    testMessage.setStringProperty("testKey", "testValue");
		    producer.send(testMessage);
		} catch (NamingException e) {
			 e.printStackTrace();
		} catch (JMSException e) {
		    e.printStackTrace();
		}
	}

}*/
