#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
      # ./gradlew jacocoTestReport --info
	./gradlew sonarqube -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH --info
fi