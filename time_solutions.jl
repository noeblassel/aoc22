#!/bin/env julia
using BenchmarkTools

for i=1:4
    include("$i/sol.jl")
end

using .DayOne,.DayTwo,.DayThree,.DayFour

module_list=[DayOne,DayTwo,DayThree,DayFour]

for (i,m)=enumerate(module_list)
    m.sol("$i/input")
end

@btime for (i,m)=enumerate(module_list)
    m.sol("$i/input")
end