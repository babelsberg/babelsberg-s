Babelsberg/S
=============
[![Build Status](https://travis-ci.org/babelsberg/babelsberg-s.png?branch=master)](https://travis-ci.org/babelsberg/babelsberg-s)

A Squeak/Smalltalk implementation of Babelsberg licensed under [MIT](https://github.com/babelsberg/babelsberg-s/blob/master/LICENSE)

See also [Babelsberg/R](https://github.com/babelsberg/babelsberg-r) and [Babelsberg/JS](https://github.com/babelsberg/babelsberg-js)

Work in progress.

##How to Install

1. Get [Squeak 4.5 or later](http://www.squeak.org) with a recent [CogVM](http://www.mirandabanda.org/files/Cog/VM/) for your operating system. Make sure that the SqueakSSL plugin is included (should be true for all official distributions.)
2. Load Babelsberg/S into your image

```Smalltalk
"Get the Metacello configuration (for Squeak users)"
Installer swasource
  project: 'SwaUtilities';
  addPackage: 'ConfigurationOfMetacello';
  install.

"Bootstrap Metacello Preview, using mcz files (#'previewBootstrap' symbolic version"
((Smalltalk at: #ConfigurationOfMetacello) project version: #'previewBootstrap') load.

(Smalltalk at: #Metacello) new
  baseline: 'BabelsbergS';
  repository: 'github://babelsberg/babelsberg-s/repository';
  load.
```

If you want to commit to Github directly from Squeak, you can try [Metacello-Git](https://github.com/timfel/metacello-git)
```Smalltalk
((MCGitHubRepository location: 'github://timfel/metacello-git/repository')
  highestNumberedVersionForPackageNamed: 'Metacello-Git') load.
```
This will allow you to add a `Git (remote)` repository to the packages in this project. It will use your system's git command. You can configure the path in the GitHub section of the Squeak Preferences tool. Note that Metacello-Git does not handle authentication - it's easiest if you use an SSH url and setup your system to automatically supply the correct public key (usually just works on Unix, you can use e.g. Pageant on Windows.)
