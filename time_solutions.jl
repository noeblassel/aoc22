#!/bin/env julia
using BenchmarkTools

for i=1:5
    include("$i/sol.jl")
end

modules=[:DayOne,:DayTwo,:DayThree,:DayFour,:DayFive]

for m=modules
    Base.require(Main,m)
end

module_list=eval.(Expr.(modules))

for (i,m)=enumerate(module_list)
    m.sol("$i/input")
end

@btime for (i,m)=enumerate(module_list)
    m.sol("$i/input")
end