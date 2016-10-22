#!/bin/bash
# This script will build the project.

git fsck --full

if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
  echo -e "Build Pull Request #$TRAVIS_PULL_REQUEST => Branch [$TRAVIS_BRANCH]"
  ./gradlew -Prelease.useLastTag=true -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST -Dsonar.github.oauth=$GITHUB_ACCESS_TOKEN build sonarqube --info
elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
  echo -e 'Build Branch with Snapshot => Branch ['$TRAVIS_BRANCH']'
  ./gradlew -Prelease.travisci=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH build snapshot sonarqube --info
 elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
  echo -e 'Build Branch for Release => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']'
  ./gradlew -Prelease.travisci=true -Prelease.useLastTag=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" -PbintrayNoDryRun -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH final sonarqube --info
else
  echo -e 'WARN: Should not be here => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']  Pull Request ['$TRAVIS_PULL_REQUEST']'
  ./gradlew -Prelease.useLastTag=true build --stacktrace
fi