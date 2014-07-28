Babelsberg/S
=============
[![Build Status](https://travis-ci.org/timfel/babelsberg-js.png?branch=master)](https://travis-ci.org/timfel/babelsberg-s)

A LivelyKernel implementation of Babelsberg licensed under [MIT](https://github.com/timfel/babelsberg-s/blob/master/LICENSE)

See also [Babelsberg/R](https://github.com/timfel/babelsberg-r) and [Babelsberg/JS](https://github.com/timfel/babelsberg-js)

Work in progress.

##How to Install

1. Get [Squeak 4.4 or later](http://www.squeak.org) with a recent [CogVM](http://www.mirandabanda.org/files/Cog/VM/) for your operating system.
2. If not already integrated, load [Metacello](https://github.com/dalehenrich/metacello-work). Learn how it [works](https://github.com/dalehenrich/metacello-work/blob/master/docs/MetacelloUserGuide.md).
3. Finally, load Babelsberg/S into your image

```Smalltalk
Metacello new
  baseline: 'BabelsbergS';
  repository: 'github://timfel/babelsberg-s/repository';
  load.
```
