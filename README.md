# stitchcounter-scm

Command line tool to help you with knitting and crocheting.

It is a porting in [CHICKEN Scheme](http://call-cc.org/) of the same program I
wrote in [Clojure](https://github.com/manuel-uberti/stitchcounter-clj) and
[C](https://github.com/manuel-uberti/c-bag/blob/master/stitchcounter.c).

## Usage
Clone this repo:
```console
$ git clone https://github.com/manuel-uberti/stitchcounter-scm.git
```
Run ```stitchcounter``` from the command line:
```console
$ cd stitchcounter-scm
$ ./stitchcounter
```
You will be presented with the following prompt:
```console
$ ./stitchcounter
Stitchcounter: useful tool to help knitting and crocheting
Options:

    1 Change gauge in a pattern
      (Pattern lists gauge and width, you want to knit
      the same width with a different gauge)

    2 Calculate number of stitches to CO
      (You have a given gauge, calculate how many stiches/rows
      you need to get a given dimension)

    3 Quit

Pick your option:
```
Pick your option and follow the instructions.

## License
Copyright © 2015 Manuel Uberti

Distributed under the GNU GENERAL PUBLIC LICENSE.
