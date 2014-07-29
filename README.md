Babelsberg/S
=============
[![Build Status](https://travis-ci.org/timfel/babelsberg-js.png?branch=master)](https://travis-ci.org/timfel/babelsberg-s)

A Squeak/Smalltalk implementation of Babelsberg licensed under [MIT](https://github.com/timfel/babelsberg-s/blob/master/LICENSE)

See also [Babelsberg/R](https://github.com/timfel/babelsberg-r) and [Babelsberg/JS](https://github.com/timfel/babelsberg-js)

Work in progress.

##How to Install

1. Get [Squeak 4.4 or later](http://www.squeak.org) with a recent [CogVM](http://www.mirandabanda.org/files/Cog/VM/) for your operating system.
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
  repository: 'github://timfel/babelsberg-s/repository';
  load.
```
