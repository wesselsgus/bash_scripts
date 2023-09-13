#!/usr/bin/env bash

(( $1 % 3 )) || raindrops+=Pling
(( $1 % 5 )) || raindrops+=Plang
(( $1 % 7 )) || raindrops+=Plong

echo "${raindrops:-$1}"
