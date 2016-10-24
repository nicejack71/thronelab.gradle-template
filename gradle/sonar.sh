#!/bin/bash

set -euo pipefail

function strongEcho {
  echo ""
  echo "================ $1 ================="
}


if [ "$TRAVIS_PULL_REQUEST" != "false" ] && [ "$TRAVIS_SECURE_ENV_VARS" == "true" ]; then
	strongEcho 'Build and analyze pull request'

	echo '======= no deploy'

    ./gradlew build check sonarqube \
      -Dsonar.analysis.mode=issues \
      -Dsonar.github.pullRequest=$TRAVIS_PULL_REQUEST \
      -Dsonar.github.repository=$TRAVIS_REPO_SLUG \
      -Dsonar.github.oauth=$GITHUB_TOKEN \
      -Dsonar.host.url=https://sonar.aldeso.com \
      -Dsonar.login=$SONAR_TOKEN \
      -Prelease.useLastTag=true

elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" == "" ]; then
  strongEcho 'Build Branch with Snapshot => Branch ['$TRAVIS_BRANCH']'

  ./gradlew build snapshot sonarqube \
  -Prelease.travisci=true \
  -PbintrayUser="${bintrayUser}" \
  -PbintrayKey="${bintrayKey}" \
  -Dsonar.host.url=https://sonar.aldeso.com \
  -Dsonar.login=$SONAR_TOKEN \
  -Dsonar.projectVersion=$TRAVIS_BRANCH




elif [ "$TRAVIS_PULL_REQUEST" == "false" ] && [ "$TRAVIS_TAG" != "" ]; then
  strongEcho 'Build Branch for Release => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']'
  ./gradlew final sonarqube \
  -Prelease.travisci=true \
  -Prelease.useLastTag=true \
  -PbintrayUser="${bintrayUser}" \
  -PbintrayKey="${bintrayKey}" \
  -PbintrayNoDryRun \
  -Dsonar.host.url=https://sonar.aldeso.com \
  -Dsonar.login=$SONAR_TOKEN \
  -Dsonar.projectVersion=$TRAVIS_BRANCH
else
  echo -e 'WARN: Should not be here => Branch ['$TRAVIS_BRANCH']  Tag ['$TRAVIS_TAG']  Pull Request ['$TRAVIS_PULL_REQUEST']'
  ./gradlew -Prelease.useLastTag=true build --stacktrace
fi
