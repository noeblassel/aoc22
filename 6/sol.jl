module DaySix
export sol

    function sol(f)
        buffer=read(f)
        return find_first_marker(buffer,4),find_first_marker(buffer,14)
    end

    function find_first_marker(buff,n)
        pack=buff[1:n]
        k=n
        repeat=true

        while repeat
            sort!(pack)
            repeat = false
            for i=1:n-1
                if pack[i]==pack[i+1]
                    repeat = true
                    break
                end
            end
            if repeat
                k+=1
                pack=buff[k-n+1:k]
            end
        end
        return k
    end

    function sol_alt(f)
        buffer=read(f)
        n_a=4
        while length(Set(buffer[n_a-3:n_a]))<4
            n_a+=1
        end
        n_b=14
        while length(Set(buffer[n_b-13:n_b]))<14
            n_b+=1
        end
        return n_a,n_b
    end
end