function sol(f)
    lines=readlines(f)
    scores=(3,6,0)
    score_a= 0
    score_b=0

    for l in lines
        op_move=Int(l[1])-65
        me_move_a=Int(l[3])-88
        me_move_b=mod(op_move+Int(l[3])-88,3)
        score_a += (me_move_a+1) + scores[1+mod(me_move_a-op_move,3)]
        score_b += (me_move_b+1) + scores[1+mod(me_move_b-op_move,3)]
    end

    return score_a,score_b
end       