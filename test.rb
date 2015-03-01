#! /usr/bin/ruby

require "./distance.rb"


a = [1, 0, 0, 0, 0, 0, 0, 0, 0]
b = [0, 0, 0, 0, 0, 0, 1, 0, 0, 1]

d = Distance.new a, b
d.SMC
d.Jaccard
