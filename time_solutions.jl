#!/bin/env julia
using BenchmarkTools

for i=1:7
    include("$i/sol.jl")
end

days=[DayOne,DayTwo,DayThree,DayFour,DayFive,DaySix,DaySeven]

sols=[(68467,203420),
        (8890,10238),
        (7763,2569),
        (507,897),
        ("RTGWZTHLD","STHGRZZFR"),
        (1093,3534)]
        
for (i,day)=enumerate(days)
     @assert day.sol("$i/input")==sols[i]
end

@btime for (i,day)=enumerate(days)
    day.sol("$i/input")
end