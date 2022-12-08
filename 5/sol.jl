module Day5
export sol

function sol(f)
    lines=readlines(f)
    n_start=first(t[1] for t=enumerate(lines) if !(occursin('[',t[2])))
    n_stacks=maximum(parse.(Int64,split(lines[n_start])))
    stacks_a=[Char[] for i=1:n_stacks]

    for ix=n_start-1:-1:1
        for (i,c)=enumerate(lines[ix][2:4:end])
            (c!=' ') && (push!(stacks_a[i],c))
        end
    end

    stacks_b = deepcopy(stacks_a)

    for l=lines[n_start+2:end]
        n,from,to=parse.(Int64,match(r"move (\d+) from (\d+) to (\d+)",l))
        tmp=Char[]
        for _=1:n
            push!(stacks_a[to],pop!(stacks_a[from]))
            push!(tmp,pop!(stacks_b[from]))
        end

        append!(stacks_b[to],Iterators.reverse(tmp))
    end

    return join(pop!.(stacks_a)),join(pop!.(stacks_b))
end

end