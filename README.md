# Docker Tests Example

Docker image example using [TDD](https://en.wikipedia.org/wiki/Test-driven_development).

The tests are implemented in **Ruby**, using the [`docker-api`](https://github.com/swipely/docker-api) and [`serverspec`](http://serverspec.org/) gems. It also uses the [`should_not`](https://github.com/should-not/should_not) gem to avoid redundant test descriptions.

The following types of tests are currently implemented:

* [Test the built image](https://github.com/zuazo/docker-tests-example/tree/master/spec/build/dockerfile_spec.rb) using the [`docker-api`](https://github.com/swipely/docker-api).
* [Test the image running](https://github.com/zuazo/docker-tests-example/tree/master/spec/run/dockerfile_spec.rb) using [Serverspec](http://serverspec.org/).

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
└── webapp: Example application to install.
```

## Questions and Improvements

This is proof of concept used by myself in my projects. If you encounter any problems or have ideas for improvements, please [open an issue](https://github.com/zuazo/docker-tests-example/issues/new)!

## Acknowledgements

This docker example does not contain anything new. It is based on multiple online sources. Mainly the following:

* https://github.com/tcnksm-sample/test-driven-development-dockerfile
* https://coderwall.com/p/5xylsg/tdd-for-dockerfile-by-rspec-severspec
* https://gist.github.com/masonforest/194e0cb6bb16c88e21a0
* https://robots.thoughtbot.com/tdd-your-dockerfiles-with-rspec-and-serverspec

Thanks to all of you ;-)
