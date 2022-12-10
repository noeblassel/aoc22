module Day3
    @inline priority(c::Char) = Int(c) - 96 + (isuppercase(c) ? 58 : 0) 

    function sol(f)
        sum_priorities_a=0
        sum_priorities_b=0

        lines= readlines(f)
        for (l1,l2,l3)=zip(lines[1:3:end],lines[2:3:end],lines[3:3:end])
            for l in (l1,l2,l3)
                N=Int(length(l)/2)
                sum_priorities_a+= priority(first(l[1:N] ∩ l[N+1:end]))
            end
            sum_priorities_b+= priority(first(l1 ∩ l2 ∩ l3))
        end
        return sum_priorities_a,sum_priorities_b
    end

end