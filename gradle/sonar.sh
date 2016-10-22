#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
      # ./gradlew jacocoTestReport --info
	 ./gradlew sonarqube  -Dsonar.issuesReport.console.enable=true -Dsonar.projectVersion=$TRAVIS_BRANCH --debug
fi

#-Dsonar.login=$SONAR_TOKEN