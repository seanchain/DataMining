#! /usr/bin/ruby

require "./distance.rb"


a = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0]
b = [0, 0, 0, 0, 0, 0, 1, 0, 0, 1]

d = Distance.new a, b
d.SMC
d.Jaccard

o = [3, 2, 0, 5, 0, 0, 0, 2, 0, 0]
p = [1, 0, 0, 0, 0, 0, 0, 1, 0, 2]
d1 = Distance.new o, p
d1.Cosine
d1.Tanimoto
