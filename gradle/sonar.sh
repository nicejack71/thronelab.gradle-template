#!/bin/bash
set -ev

if [ "${TRAVIS_PULL_REQUEST}" != "false" ]; then
    ./gradlew sonarqube -Dsonar.login=$SONAR_TOKEN -Dsonar.host.url=https://sonar.aldeso.com -Dsonar.projectVersion=$TRAVIS_BRANCH -Dsonar.analysis.mode=preview -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST -Dsonar.github.repository=$TRAVIS_REPO_SLUG  -Dsonar.github.oauth=$GITHUB_TOKEN

fi
#
#
#if [ "$TRAVIS_PULL_REQUEST" != "false" ]; then
#   sonar-scanner -Dsonar.login=$SONAR_TOKEN -Dsonar.host.url=https://sonar.aldeso.com -Dsonar.projectVersion=$TRAVIS_BRANCH -Dsonar.analysis.mode=preview -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST -Dsonar.github.oauth=$GITHUB_ACCESS_TOKEN
#
#elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
#  echo -e 'Build Branch with Snapshot => Branch ['$TRAVIS_BRANCH']'
#  ./gradlew -Prelease.travisci=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH build snapshot sonarqube --info
# elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
#  echo -e 'Build Branch for Release => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']'
#  ./gradlew -Prelease.travisci=true -Prelease.useLastTag=true -PbintrayUser="${bintrayUser}" -PbintrayKey="${bintrayKey}" -PbintrayNoDryRun -Dsonar.login=$SONAR_TOKEN -Dsonar.projectVersion=$TRAVIS_BRANCH final sonarqube --info
#else
#  echo -e 'WARN: Should not be here => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']  Pull Request ['$TRAVIS_PULL_REQUEST']'
#  ./gradlew -Prelease.useLastTag=true build --stacktrace
#fi