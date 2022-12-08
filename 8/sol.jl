module Day8

    export sol

    function sol(f)
        rows = [collect(Char,l) for l in readlines(f)]
        grid= reduce(hcat, rows)
        grid = transpose( UInt8.(Int.(grid) .- 48) )
        
        w,_ = size(grid) # h=w

        l_visible = falses(w,w) # trees visible from the left
        r_visible = falses(w,w) # from the right
        t_visible = falses(w,w) # from the top
        b_visible =falses(w,w) # from the bottom

        scores = zeros(Int64,w,w)

        for i=1:w
            r_record=l_record=b_record=t_record=-Inf
            for j=1:w
                l_visible[i,j]= (grid[i,j] > l_record)
                l_record = max(l_record,grid[i,j])

                r_visible[i,w-j+1]= (grid[i,w-j+1] > r_record)
                r_record = max(r_record,grid[i,w-j+1])

                t_visible[j,i] = (grid[j,i] > t_record)
                t_record = max(t_record,grid[j,i])

                b_visible[w-j+1,i] = (grid[w-j+1,i]> b_record)
                b_record = max(b_record,grid[w-j+1,i])

                x = j-1
                while (x>=1) && (grid[i,x] < grid[i,j]) 
                    x-=1
                end
                l_dist=j-max(1,x)
                x=j+1
                while (x<=w) && (grid[i,x] < grid[i,j]) 
                    x+=1
                end
                r_dist = min(w,x)-j

                y = i-1
                while (y>=1) && (grid[y,j] < grid[i,j]) 
                    y-=1
                end
                t_dist=i-max(1,y)
                y=i+1
                while (y<=w) && (grid[y,j] < grid[i,j]) 
                    y+=1
                end
                b_dist = min(w,y)-i

                scores[i,j] = l_dist * r_dist * t_dist * b_dist
            end
        end

        visible_trees =  @.(r_visible || l_visible || b_visible || t_visible)
        return sum(visible_trees),maximum(scores)
    end
end