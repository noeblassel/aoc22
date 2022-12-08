#!/bin/env julia
using HTTP
day_n=ARGS[1]
token=read("session.txt",String)

url= "https://adventofcode.com/2022/day/$day_n/input"
mkdir(day_n)

sol_template="""Module Day$day_n
    function sol(f)
        lines=readlines(f)
    end
end
"""

sol_file = open(joinpath(day_n,"sol.jl"),"w")
print(sol_file,sol_template)
close(sol_file)

HTTP.request_uri(url,)