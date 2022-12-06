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
end