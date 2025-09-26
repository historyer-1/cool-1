class Node inherits IO{
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

    getVal() : Int{
        val
    };

    print() : Node{
        {
            if not (isvoid left) then
                left.print()
            else
                0  
            fi;
            out_int(val);
            out_string(" ");
            if not (isvoid right) then
                right.print()
            else
                0  
            fi;
            self;
        }

    };
};

class BTree inherits IO{
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

    print() : BTree{
        if isvoid root then
        {
            out_string("The tree is empty");
            self;
        }
        else
        {
            root.print();
            self;
        }
        fi  
    };


};



class Main {
    main() : Int{
        {
            let bt : BTree <- (new BTree).init(6) in 
            {
                bt.insert(3);
                bt.insert(9);
                bt.insert(17);
                bt.print();
            };
            0;
        }
    };
};