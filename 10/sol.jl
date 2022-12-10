module Day10
    function sol(f)
        lines=readlines(f)
        crt=fill('.',240)
        Xs=Int64[]
        X=1
        t=0
        for l in lines
            args=split(l)
            if args[1]=="addx"
                (abs(mod(t,40)-X)<=1) && (crt[t+1]='#')
                push!(Xs,X)
                t+=1

                (abs(mod(t,40)-X)<=1) && (crt[t+1]='#')
                X+=parse(Int64,args[2])
                push!(Xs,X)
                t+=1
            else
                (abs(mod(t,40)-X)<=1) && (crt[t+1]='#')
                push!(Xs,X)
                t+=1
            end
        end

        return sum(t*Xs[t-1] for t=(20,60,100,140,180,220)), join(map(join,reshape(crt,(40,6)) |> eachcol),'\n')
    end
end
