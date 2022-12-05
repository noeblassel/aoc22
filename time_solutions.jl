#!/bin/env julia
using BenchmarkTools

for i=1:5
    include("$i/sol.jl")
end

days=[DayOne,DayTwo,DayThree,DayFour,DayFive]

for (i,day)=enumerate(days)
    day.sol("$i/input")
end

@btime for (i,day)=enumerate(days)
    day.sol("$i/input")
end