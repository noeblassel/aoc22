module Day9

    using StaticArrays, Plots

    function sol(f)
        lines=readlines(f)

        n_links=10
        visited_positions_neck=Set{Tuple{Int64,Int64}}()
        visited_positions_tail=Set{Tuple{Int64,Int64}}()

        chain = [MVector(0,0) for i=1:n_links]

        push!(visited_positions_neck, (0,0))
        push!(visited_positions_tail,(0,0))
        
        dir_dict=Dict("L"=>SVector(-1,0),"R"=>SVector(1,0),"U"=>SVector(0,1),"D"=>SVector(0,-1))
        for l in lines
            dir,L = split(l)
            L=parse(Int64,L)
            dx = dir_dict[dir]

            for i=1:L
                chain[1]+=dx
                tug!(chain[1],chain[2],visited_positions_neck)
                for link=2:n_links-2
                    tug!(chain[link],chain[link+1])
                end
                tug!(chain[n_links-1],chain[n_links],visited_positions_tail)
            end
        end

        return length(visited_positions_neck),length(visited_positions_tail)
    end

    function tug!(head::MVector{2,Int64},tail::MVector{2,Int64},visited_positions=nothing)

        dx = head-tail
        abs_dx = abs.(dx)

         @inbounds if (sum(abs_dx)>1) && !((abs_dx[1]==1)&&(abs_dx[2]==1))
            tail .+= sign.(dx)
        end

        (visited_positions !== nothing) && (push!(visited_positions,(tail[1],tail[2])))
    end
end
