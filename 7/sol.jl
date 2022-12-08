module DaySeven
export sol,FileTree

    mutable struct FileTree
        parent :: FileTree
        size :: Int64
        children :: Dict{String,FileTree}

        #constructors
        FileTree() = (t=new(); t.parent=t; t.size=0; t.children=Dict{String,FileTree}();return t)
        FileTree(parent::FileTree,size::Int64) = (t = FileTree();t.parent=parent;t.size=size;return t)
        FileTree(parent::FileTree) = FileTree(parent,0)
    end
    
    function sol(f)
        lines=readlines(f)
        root_node = FileTree()
        current_node = root_node
        answers = [0,70000000]

        for l in lines
            args=split(l)
            if args[1]=="\$"
                if args[2]=="cd"
                    if args[3]=="/"
                        current_node = root_node
                    elseif args[3]==".."
                        current_node = current_node.parent
                    else
                        current_node = current_node.children[args[3]]
                    end
                end
            else
                if args[1]=="dir"
                    current_node.children[args[2]] = FileTree(current_node)
                else
                    size=parse(Int64,args[1])
                    current_node.children[args[2]] = FileTree(current_node,size)
                end
            end
        end

        calc_sizes!(root_node,answers)
        unused_space = 70000000 - root_node.size
        find_optimal_deletion!(root_node,answers,unused_space)

        return answers
    end


    function calc_sizes!(node::FileTree,answers::Vector{Int64})
        isempty(node.children) && return node.size # case of a file
        node.size = sum(calc_sizes!(n,answers) for n in values(node.children))
        (node.size <= 100000) && (answers[1]+=node.size)
        return node.size
    end

    function find_optimal_deletion!(node::FileTree,answers::Vector{Int64},unused_space::Int64)
        isempty(node.children) && return
        (node.size + unused_space >= 30000000) && (answers[2] = min(node.size,answers[2]))
        for n in values(node.children)
            find_optimal_deletion!(n,answers,unused_space)
        end
    end

end