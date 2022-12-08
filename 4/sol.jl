module Day4

export sol

    function sol(f)
        lines=readlines(f)
        n_subset=0
        n_overlap=0
        for l=lines
            a,b,c,d=parse.(Int64,split(l,r"[-,]"))
            x,y=max(a,c),min(b,d)
            (((a,b) == (x,y))||((c,d) == (x,y))) && (n_subset+=1)
            (x<=y) && (n_overlap+=1)
        end
        return n_subset,n_overlap
    end

end