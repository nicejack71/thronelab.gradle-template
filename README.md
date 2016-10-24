# thronelab.gradle-template

[![Download](https://api.bintray.com/packages/thronelab/iThroneLab/thronelab.gradle-template/images/download.svg) ](https://bintray.com/thronelab/iThroneLab/thronelab.gradle-template/_latestVersion)
[![Build Status](https://travis-ci.org/iThroneLab/thronelab.gradle-template.svg?branch=master)](https://travis-ci.org/iThroneLab/thronelab.gradle-template)
[![Quality Gate](https://sonar.aldeso.com/api/badges/gate?key=com.thronelab:thronelab.gradle-template)](https://sonar.aldeso.com/dashboard/index/com.thronelab.thronelab.gradle-template)
[![codecov](https://codecov.io/gh/iThroneLab/thronelab.gradle-template/branch/master/graph/badge.svg)](https://codecov.io/gh/iThroneLab/thronelab.gradle-template)
[![Quality Gate](https://sonar.aldeso.com/api/badges/gate?key=com.thronelab:thronelab.gradle-template)](https://sonar.aldeso.com/dashboard/index/com.thronelab:thronelab.gradle-template)
[![Quality Gate](https://sonar.aldeso.com/api/badges/gate?key=com.thronelab:thronelab.gradle-template&metric=bugs&blinking=true )](https://sonar.aldeso.com/dashboard/index/com.thronelab:thronelab.gradle-template)
A template for java projects with gradle.


Example setup build.gradle file:

```groovy

group = 'com.thronelab'
description = 'Template for the thronelab projects.'
github {
    user 'the_github_user'
    license 'Apache'
}
contacts {
    'yourEmail' {
        roles 'owner' 
        moniker 'yourName'
        github github.user
    }
}
```