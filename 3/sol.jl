@inline priority(c::Char) = Int(c) - 96 + (isuppercase(c) ? 58 : 0) 

function sol(f)
    sum_priorities=0
    lines= readlines(f)
    for l in lines
        N=Int(length(l)/2)
        common_item = pop!(Set(l[1:N]) ∩ Set(l[N+1:end]))
        sum_priorities += priority(common_item)
    end
    return sum_priorities
end

function sol2(f)
    sum_priorities=0
    lines=readlines(f)
    for (l1,l2,l3)=zip(lines[1:3:end],lines[2:3:end],lines[3:3:end])
        common_item = pop!( Set(l1) ∩ Set(l2) ∩ Set(l3) )
        sum_priorities += priority(common_item)
    end

    return sum_priorities
end