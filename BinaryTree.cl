class Node {
    val  : Int;
    left  : Node;
    right  : Node;

    init(v : Int) : Node{
        {
            val <- v;
            self;
        }
        
    };

    insert(v : Int) : Node{
        {
            if v < val then
                if isvoid left then
                    left <- (new Node).init(v)
                else
                    left.insert(v)
                fi
            else
                if isvoid right then
                    right <- (new Node).init(v)
                else
                    right.insert(v)
                fi
            fi;
            self;
        }
    };
};

class BTree {
    root : Node;

    init(v : Int) : BTree{
        {
            root <- (new Node).init(v);
            self;
        }
    };

    insert(v : Int) : BTree{
        {
            root.insert(v);
            self;
        }

    };

};

class Main {
    main() : Int{
        {
            let bt : BTree <- (new BTree).init(6) in 
            {
                bt.insert(3);
            };
            0;
        }
    };
};