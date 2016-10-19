# thronelab.gradle-template

[![Download](https://api.bintray.com/packages/thronelab/iThroneLab/thronelab.gradle-template/images/download.svg) ](https://bintray.com/thronelab/iThroneLab/thronelab.gradle-template/_latestVersion)
[![Build Status](https://travis-ci.org/iThroneLab/thronelab.gradle-template.svg?branch=master)](https://travis-ci.org/iThroneLab/thronelab.gradle-template)
[![Quality Gate](http://sonar.aldeso.com:88/api/badges/gate?key=com.thronelab.thronelab.gradle-template&blinking=true)](http://sonar.aldeso.com:88/dashboard/index/com.thronelab.thronelab.gradle-template)


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