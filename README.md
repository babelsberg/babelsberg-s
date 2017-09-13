Babelsberg/S
=============
[![Build Status](https://travis-ci.org/babelsberg/babelsberg-s.png?branch=master)](https://travis-ci.org/babelsberg/babelsberg-s)

A Squeak/Smalltalk implementation of Babelsberg licensed under [MIT](https://github.com/babelsberg/babelsberg-s/blob/master/LICENSE)

See also [Babelsberg/R](https://github.com/babelsberg/babelsberg-r) and [Babelsberg/JS](https://github.com/babelsberg/babelsberg-js)

Work in progress.

## How to Install

#### Download prebuilt image

Prebuilt images are published when the tests are green. You probably
want the
[Image](http://www.lively-kernel.org/babelsberg/BabelsbergS/BabelsbergS.image),
[Changes](http://www.lively-kernel.org/babelsberg/BabelsbergS/BabelsbergS.changes),
and [Sources](http://www.lively-kernel.org/babelsberg/BabelsbergS/SqueakV41.sources). You can also [try it online](https://bertfreudenberg.github.io/SqueakJS/run#url=http://www.lively-kernel.org/babelsberg/BabelsbergS/&files=[BabelsbergS.image,BabelsbergS.changes,SqueakV41.sources]) through [SqueakJS](http://github.com/bertfreudenberg/SqueakJS) (but note that this runs very slowly, and does not support Z3).

#### Install into your own image

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

## How to develop

If you want to forward development, there are a number of areas that
need work. In general, the system needs to be refactored so other
constraint solvers (e.g. DeltaBlue) can be added more easily. There
are also a number of things that this implementation does not do, yet,
that are desirable, such as identity constraints, constraint
priorities at time of definition, proper readonly variables, or
automatic recalculation of constraints when a complex object involved
in the constraint changes identity (the latter is an optimization
found in the Babelsberg/R and Babelsberg/JS implementations). Further
down the road, the constraints from different constraint solvers
should be able to interact (as implemented in Babelsberg/JS).

The repository includes a package, Babelsberg-Tests, that includes the
conformance tests generated from the
[executable semantics](https://github.com/babelsberg/babelsberg-rml). These
may be a little outdated if they have not been regenerated in some
time, but in any case, a goal for further development should be to
improve pass rates on these tests. As a guideline, Babelsberg/JS
currently passes 39 of these tests using a combination of Z3 and
DeltaBlue (the latter for identity constraints). Getting the number
for Babelsberg/S up to mid-30 would be worthwhile.

## License

All files _except_ those in [Cassowary.package](repository/Cassowary.package) are under [the MIT License](LICENSE).  
The files _in_ [Cassowary.package](repository/Cassowary.package) are under [the LGPL License](LICENSE.Cassowary)

