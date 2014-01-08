# Precure

Japanese Anime Precure (Pretty Cure) Library.

Inspired by [Acme::PrettyCure](http://perl-users.jp/articles/advent-calendar/2010/acme/6), [pycure](https://github.com/drillbits/pycure) and [Rubicure](https://github.com/sue445/rubicure).

## Installation

	$ cd ~/.lisp/systems
	$ git clone git://github.com/stibear/precure

## Usage

```
PRECURE> (init)
=> NIL
PRECURE> (precure "smile")
=> #<PRECURE "スマイルプリキュア!">
PRECURE> (girls (precure ""))
=> (#<FIRST-GIRL "美墨なぎさ"> #<FIRST-GIRL "雪城ほのか">)
PRECURE> (transform (car (girls (precure ""))))
デュアル・オーロラ・ウェイブ！
光の使者、キュアブラック！
光の使者、キュアホワイト！
ふたりはプリキュア！
闇の力のしもべ達よ！
とっととお家に帰りなさい！
=> #<TRANSFORMED-FIRST-GIRL "キュアブラック">
```
