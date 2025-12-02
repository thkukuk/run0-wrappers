# Building and installing run0-wrappers

## Building

Building with Meson is quite simple:

```shell
$ meson setup build
$ meson compile -C build
```
## Run tests

`run0` uses polkit for authentication. Depending on the configuration, the tests may ask for a password. This will fail, since meson does not allow input for the tests. So please make sure that polkit permits access with password for the test run.

```
$ meson test -C build
```

## Installation

```
$ run0 meson install -C build
```
