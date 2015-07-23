# Docker Tests Example [![Build Status](http://img.shields.io/travis/zuazo/docker-tests-example.svg?style=flat)](https://travis-ci.org/zuazo/docker-tests-example)

Docker image example using [TDD](https://en.wikipedia.org/wiki/Test-driven_development).

The tests are implemented in **Ruby**, using the [`docker-api`](https://github.com/swipely/docker-api) and [`serverspec`](http://serverspec.org/) gems.

The following features are currently implemented:

* [Test the built image](https://github.com/zuazo/docker-in-travis/tree/master/spec/build/dockerfile_spec.rb) using [`docker-api`](https://github.com/swipely/docker-api).
* [Test the image running](https://github.com/zuazo/docker-in-travis/tree/master/spec/run/dockerfile_spec.rb) using [Serverspec](http://serverspec.org/).
* Run the tests inside [Travis CI](https://travis-ci.org). See the [.travis.yml](https://github.com/zuazo/docker-in-travis/blob/master/.travis.yml) file.
* Check the tests with [`should_not`](https://github.com/should-not/should_not) gem to avoid redundant test descriptions.
* Run the tests in random order.

**Note:** This example installs a simple Apache & PHP application, but could be anything else.

## Run the Tests

You can use the [`bundler`](http://bundler.io/) Ruby gem to install all the requirements to run the tests:

    $ gem install bundler
    $ bundle install

You can now run the tests running RSpec:

    $ rspec

Output example:

```
Randomized with seed 52614

Docker image run
  installs PHP version 5.6
  returns my web page
  Process "apache2"
    should be running
  File "/var/www/html/index.php"
    should be file
  Package "apache2"
    should be installed

Dockerfile build
  has the website path as workdir
  has PHP installed
  creates image
  runs apache in foreground
  exposes the port 80

Finished in 1.26 seconds (files took 0.20144 seconds to load)
10 examples, 0 failures

Randomized with seed 52614
```

See also the [Travis CI output](https://travis-ci.org/zuazo/docker-in-travis) as an example.

## Directory Structure

```
├── Dockerfile
├── .dockerignore: Files to be ignored by docker copy instructions.
├── Gemfile: File to install the gems required to run the tests.
├── .gitignore: Intentionally untracked files to be ignored by git.
├── LICENSE: Software license.
├── README.md
├── spec/
│   ├── build/: Tests to verify the built image.
│   ├── run/: Tests to verify the image running (Serverspec).
│   ├── serverspec_helper.rb: Helper file to setup Serverspec.
│   └── spec_helper.rb: Helper file to setup all the tests.
├── .travis.yml: Travis CI configuration file.
└── webapp/: Example application to install.
```

## Questions and Improvements

This is proof of concept used by myself in my projects. If you encounter any problems or have ideas for improvements, please [open an issue](https://github.com/zuazo/docker-in-travis/issues/new)!

## Acknowledgements

This docker example does not contain anything new. It is based on multiple online sources. Mainly the following:

* https://github.com/tcnksm-sample/test-driven-development-dockerfile
* https://coderwall.com/p/5xylsg/tdd-for-dockerfile-by-rspec-severspec
* https://gist.github.com/masonforest/194e0cb6bb16c88e21a0
* https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec
* https://github.com/lukecyca/travis-docker-example
* https://github.com/mdarse/travis-docker-build
* https://github.com/d11wtq/dockerpty/blob/master/.travis.yml
* https://github.com/gap-system/gap-docker-travis
* https://github.com/rocker-org/rocker/blob/56cb59cc262e9d2c02f9e11cfacab65f0b659c5f/.travis.yml

Thanks to all of you ;-)
