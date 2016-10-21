#!/bin/bash
# This script will build the project.

git fsck --full

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo -e "Build Pull Request #$TRAVIS_PULL_REQUEST => Branch [$TRAVIS_BRANCH]"
  ./gradlew -Prelease.useLastTag=true build --info
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
  echo -e 'Build Branch with Snapshot => Branch ['$TRAVIS_BRANCH']'
  ./gradlew -Prelease.travisci=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" build snapshot --info;
	 sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.issuesReport.console.enable=true  -Dsonar.host.url=https://sonar.aldeso.com -Dsonar.jacoco.reportPath=build/jacoco/test.exec -Dsonar.projectVersion=$TRAVIS_BRANCH

 elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
  echo -e 'Build Branch for Release => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']'
  ./gradlew -Prelease.travisci=true -Prelease.useLastTag=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" -PbintrayNoDryRun final --info;
	 sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.issuesReport.console.enable=true  -Dsonar.host.url=https://sonar.aldeso.com -Dsonar.jacoco.reportPath=build/jacoco/test.exec -Dsonar.projectVersion=$TRAVIS_BRANCH

else
  echo -e 'WARN: Should not be here => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']  Pull Request ['$TRAVIS_PULL_REQUEST']'
  ./gradlew -Prelease.useLastTag=true build --stacktrace
fi