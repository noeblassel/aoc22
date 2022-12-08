module Day1

export sol
    function sol(f)
        lines=readlines(f)
        elves=Int64[]
        current_elve=0

        for l=lines
            if l!=""
                current_elve+=parse(Int64,l)
            else
                push!(elves,current_elve)
                current_elve=0
            end
        end

        sort!(elves)
        return elves[end],sum(elves[end-2:end])
    end

end