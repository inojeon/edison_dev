#!/bin/bash

./a.out -inp $2

gnuplot plot.gnu

rm -f plot.gnu
mv result.png result/
mv result.oneD result/
