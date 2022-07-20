# App skeleton

<a href="https://circleci.com/gh/badges/shields/tree/master">
    <img src="https://img.shields.io/circleci/project/github/badges/shields/master" alt="build status">
</a>
<a href="https://circleci.com/gh/badges/daily-tests">
    <img src="https://img.shields.io/circleci/project/github/badges/daily-tests?label=service%20tests"
        alt="service-test status">
</a>
<a href="https://coveralls.io/github/badges/shields">
    <img src="https://img.shields.io/coveralls/github/badges/shields"
        alt="coverage">
</a>
<a href="https://lgtm.com/projects/g/badges/shields/alerts/">
    <img src="https://img.shields.io/lgtm/alerts/g/badges/shields"
        alt="Total alerts"/>
</a>

![coverage](https://img.shields.io/badge/coverage-80%25-yellowgreen)
![version](https://img.shields.io/badge/version-1.2.3-blue)
![dependencies](https://img.shields.io/badge/dependencies-out%20of%20date-orange)
![codacy](https://img.shields.io/badge/codacy-B-green)
![semver](https://img.shields.io/badge/semver-2.0.0-blue)

<!--
[![CodeQL](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/codeql.yml)
[![Lint Code Base](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/linter.yml)
[![Links (Fail Fast)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml/badge.svg)](https://github.com/qte77/ML-HF-WnB-MVP/actions/workflows/links-fail-fast.yml)
-->

App skeleton to be used as github template repo.

## Status

**[DRAFT]** **[WIP]**

## Quickstart

* Quickstart

## TOC

* [Usage](#usage-)
* [Install](#install-)
* [Purpose](#purpose-)
* [Reason](#reason-)
* [Paradigms](#paradigms-)
* [App Structure](#app-structure-)
* [App Details](#app-details-)
* [TODO](#todo-)
* [Inspirations](#inspirations-)
* [Rescources](#resources-)

## Usage [↑](#app-skeleton)

* Usage

## Install [↑](#app-skeleton)

* Install

## Purpose [↑](#app-skeleton)

* Purpose

## Reason [↑](#app-skeleton)

* Reason

## Paradigms [↑](#app-skeleton)

* Keep to low branching factor and single outcomes
* Export complex functions into modules
* Aims for coding approach
  * Behavior Driven Design (What should it do?)
  * Test Driven Design (Does it do?)
* Aims for code quality
  * Works, i.e. passes tests which were written before 
  * Modular and cohesive
  * Separation of concerns and appropriate coupling
  * Abstraction and information hiding
* Aims for CI/CD
  * Unit Testing
  * Acceptance Testing
  * Performance Testing
  * Static Analysis
  * Sign-offs
  * Security Testing
  * Scalability Testing
  * Realeasable Outcome

## App Structure [↑](#app-skeleton)

```
/
├─ sub1/
│  ├─ sub1sub1/
│  │  ├─ 
│  │  └─ 
│  └─ file
├─ sub2/
│  └─ file
├─ file
└─ file
```

## App Details [↑](#app-skeleton)

* Details

## TODO [↑](#app-skeleton)

* Structure
  * [x] Adopt [SemVer](https://semver.org/)
    * Using MAJOR.MINOR.PATCH (Breaking.Feature.Patch)
  * [x] Adopt [CHANGELOG.md](https://keepachangelog.com/)
    * Using Added, Removed, Changed and Unreleased inside CHANGELOG
  * [x] Test [Pipfile](https://pypi.org/project/pipfile/)
    * Adopted as [proposed successor](https://github.com/pypa/pipfile#the-concept) of requirements.txt
    * Several advantages like auto-venv and combined prod/dev in one TOML
    * [pipenv with Pipfile & Pipfile.lock](https://pipenv.pypa.io/en/latest/basics/)
    * `pipenv install -e` for [editable mode](https://pipenv.pypa.io/en/latest/basics/#a-note-about-vcs-dependencies), i.e. 'dependency resolution can be performed with an up to date copy of the repository each time it is performed'
  * [x] Use `Makefile` instead of self-implemented imparative `setup.sh`
    * Implemented and functional
    * Need improvement for local venv install, because `source` can not run inside `make`
  * [ ] Dynamically create a hierarchical configuration with [hydra](https://hydra.cc/docs/intro/)
  * [ ] Implement basic CI/CD-Skeleton
  * [ ] Create /docs with [`sphinx`](https://www.sphinx-doc.org/) gh-action
* Coding
  * [x] Try `dataclass` and `field` from [`dataclasses`](https://docs.python.org/3/library/dataclasses.html)
    * Used to auto add special classes like `__init__`, `__str__`, `__repr__`
    * Suitable for more complex classes and projects
  * [ ] Have a look at [PyTest](http://pytest.org/)
  * [ ] Consistent typing and type hinting
  * [ ] Use [`pydantic`](https://pydantic-docs.helpmanual.io/) for type hinting and errmsg
  * [ ] Consistent usage of pydoc for /docs with [`pandoc`](https://pypi.org/project/pandoc/)
  * [ ] Decouple concerns into separate containers, e.g. avoid big container because of `torch`
  * Uses type hinting and decorators
  * [ ] Consistent usage of `if` or `try` for features and catches
  * [ ] Try [`arparse`](https://docs.python.org/3/library/argparse.html)
  * [ ] Try [`logging`](https://docs.python.org/3/howto/logging.html) instead of `print()`
* Dependency tracking and app sourcing
  * [ ] Test `__init__.py` for pkg
  * [ ] Provide package as [single source app version](https://packaging.python.org/guides/single-sourcing-package-version/) with `setup.py`
  * [ ] Experiment with [`pyproject.toml`](https://pip.pypa.io/en/stable/reference/build-system/pyproject-toml/) to build app wheel
* Best Practices
  * [ ] Adhere to [Docker BP](https://docs.docker.com/develop/develop-images/dockerfile_best-practices/)
  * [ ] Adhere to BP from [The Hitchhiker’s Guide to Python!](https://docs.python-guide.org/)

 ## Inspirations [↑](#app-skeleton)

* While-True-Do.io [Repo template](https://github.com/whiletruedoio/template)
* Arc-Project [Pydantic](https://github.com/arc-community/arc)
* Mala-Project [Pydoc to Sphinx](https://github.com/mala-project/mala)
* xformers [Conda env file](https://github.com/facebookresearch/xformers)
* Jupyter [Notebook structure](https://github.com/jupyter/notebook)

## Resources [↑](#app-skeleton)

* Development
  * Dave Farley: [Test Driven Development vs Behavior Driven Development](https://www.youtube.com/watch?v=Bq_oz7nCNUA)
  * Dave Farley: [How to Build a DEPLOYMENT PIPELINE? (Continuous Delivery)](https://www.youtube.com/watch?v=x9l6yw1PFbs)