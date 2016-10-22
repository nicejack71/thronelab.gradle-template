#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
      # ./gradlew jacocoTestReport --info
	 sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.issuesReport.console.enable=true -Dsonar.projectVersion=$TRAVIS_BRANCH
fi