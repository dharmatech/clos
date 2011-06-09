
# What is this?

Tiny CLOS for R6RS Scheme.

Christian Sloma did the [original conversion](https://code.launchpad.net/~c-sloma/r6rs-clos/r6rs-clos-dev) to R6RS. The Mosh Scheme
team packaged it for Mosh. I ran into some issues in getting Sloma's
original version running. So I tweaked Mosh's version to work with
other implementations. The basic test program [test.sps](https://github.com/dharmatech/clos/blob/master/test.sps) runs in Chez,
Ikarus, and Ypsilon. You can load the libraries into Mosh, but the
test program doesn't pass due to a [bug in Mosh](http://code.google.com/p/mosh-scheme/issues/detail?id=202) (thanks to David Banks for help with that).

The only dependency is [surfage](https://github.com/dharmatech/surfage).

# Setup

```
$ cd ~/scheme # Where '~/scheme' is the path to your Scheme libraries
$ git clone git://github.com/dharmatech/surfage.git
$ git clone git://github.com/dharmatech/clos.git
```

