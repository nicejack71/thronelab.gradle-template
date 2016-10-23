package com.thronelab.template;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author Rene Neubert
 */
public class HelloWorld {


	private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorld.class);

	private String name;


	private HelloWorld() {

		throw new IllegalAccessError();
	}


	/**
	 * @param args the arguments
	 */
	public static void main(String[] args) {

		LOGGER.info("Hello World");
		HelloWorld helloWorld = new HelloWorld();
	}


	public String getName() {

		return name;
	}


	public void setName(String name) {

		this.name = name;
	}
}
