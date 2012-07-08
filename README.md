Citrus
======

Continous Integration for non-ideal world.

An exercise to build tool for myself that:

- provides minimum relevant features to build projects I work on
- does not get into my way
- is hosted in my DC

Read more about rationale and vision [here](https://github.com/pawelpacana/citrus/blob/master/VISION.md).

## Is it any good?

Not yet. First it has to build itself. Also some torture and load testing is required.

[![Build Status](https://secure.travis-ci.org/pawelpacana/citrus.png?branch=master)](http://travis-ci.org/pawelpacana/citrus)


## Developing


### Running tests

    git submodule init
    git submodule update
    bundle
    bundle exec rake test:unit test:integration test:acceptance # bundle exec rake test


### Test driven development

    guard start

### Reload driven development

    foreman start


### Ideas for improvement

- pluggable backend (memory, pstore, sqlite maybe)
- single page application on frontend
- general API improvements (JSON with HAL)
- design client API for notifications
- streaming backend for mongrel2 with ZMQ subscriber (notifications)
