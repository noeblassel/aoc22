module DayTwo

export sol
    function sol(f)
        lines=readlines(f)
        scores=(3,6,0) #draw, win, loss
        score_a= 0
        score_b=0

        for l in lines
            op_move=Int(l[1])-65 # (A,B,C) -> (0,1,2) ≅ (rock,paper,scissors)
            me_move_a=Int(l[3])-88 # (X,Y,Z) -> (0,1,2) ≅ (rock,paper,scissors)
            me_move_b=mod(op_move+Int(l[3])-89,3) # (X,Y,Z) -> (-1,0,1) ≅ (loss,draw,win)
            score_a += (me_move_a + 1) + scores[1+mod(me_move_a - op_move,3)]
            score_b += (me_move_b + 1) + scores[1+mod(me_move_b - op_move,3)]
        end

        return score_a,score_b
    end
end