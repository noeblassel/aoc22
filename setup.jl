#!/bin/env julia
using Downloads

day_n=ARGS[1]

token=read("session.txt",String)
url= "https://adventofcode.com/2022/day/$day_n/input"

!isdir(day_n) && mkdir(day_n)

sol_template="""module Day$day_n
    function sol(f)
        lines=readlines(f)
    end
end
"""

Downloads.download(url, joinpath(day_n,"input"), headers = Dict("Cookie"=>token,"User-Agent"=>"Julia script"))

sol_file = open(joinpath(day_n,"sol.jl"),"w")
print(sol_file,sol_template)
close(sol_file)