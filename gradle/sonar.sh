#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
      # ./gradlew jacocoTestReport --info
	 sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.issuesReport.console.enable=true  -Dsonar.host.url=http://sonar.aldeso.com:88 -Dsonar.jacoco.reportPath=build/jacoco/test.exec -Dsonar.projectVersion=$TRAVIS_BRANCH
fi