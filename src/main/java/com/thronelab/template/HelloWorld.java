package com.thronelab.template;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author Rene Neubert
 */
public class HelloWorld {

  private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorld.class);

  private HelloWorld() {
    throw new IllegalAccessError();
  }

  /**
   * @param args the arguments
   */
  public static void main(String[] args) {
    LOGGER.info("Hello World");
  }
}
