package com.thronelab.template;


import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


/**
 * @author Rene Neubert
 */
public class HelloWorldTest {
  private static final Logger LOGGER = LoggerFactory.getLogger(HelloWorld.class);
  private String name;

  @Test
  public void name() {

    if (name.isEmpty()) {
      LOGGER.info("name is empty!");
    }

  }

  @Before
  public void setUp() {
    name = "";
  }

}