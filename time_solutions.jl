#!/bin/env julia
using BenchmarkTools

ndays = parse(Int64,ARGS[1])

include("answers.jl")

for i=1:ndays
    include("$i/sol.jl")
end

solutions=[eval(Meta.parse("Day$i.sol")) for i=1:ndays]
for (i,sol)=enumerate(solutions)
     @assert sol("$i/input")==answers[i]
end

@btime for (i,sol)=enumerate(solutions)
    sol("$i/input")
end