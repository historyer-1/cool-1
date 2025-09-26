class StackNode{
    item : Object;
    ne : StackNode;

    -- 初始化
    init(i : Object,n : StackNode) : StackNode{
        {
            item <- i;
            ne <- n;
            self;
        }
    };

    -- 取数据
    getItem() : Object{
        item
    };

    -- 下一个节点
    getNe() : StackNode{
        ne
    };
};

class Stack inherits IO{
    top : StackNode;

    -- 添加元素
    push(item : Object) : Stack{
        {
            top <- (new StackNode).init(item,top);
            self;
        }

    };

    -- 删除栈顶元素
    pop() : Object{
        if isEmpty() then 
        {
            out_string("Error : The stack is empty,can not pop\n");
            abort();
            -- new Object;
        }
        else
        {
            let pop_item : Object <- top.getItem() in
            {
                top <- top.getNe();
                pop_item;
            };
        }
        fi
    };

    isEmpty() : Bool{
        isvoid top
    };

    peek() : Object{
        if isEmpty() then
        {
            out_string("Error : The stack is empty cannot peek\n");
            abort();
            -- new Object;
        }
        else
            top.getItem()
        fi
    };

    print() : Stack {
        {
            if isEmpty() then
                out_string("Empty stack\n")
            else
            {
                let current : StackNode <- top in
                    while not (isvoid current) loop
                    {
                        let item : Object <- current.getItem() in
                            case item of
                                i : Int => out_int(i);
                                s : String => out_string(s);
                                o : Object => out_string(o.type_name());
                            esac;
                        out_string(" ");
                        current <- current.getNe();
                    }
                    pool;
                out_string("\n");
            }
            fi;
            self;
        }
    };

};

-- 测试类，用于测试将对象插入栈
class Test{

};

class Main inherits IO{
    main() : Int{
        {
            let stack : Stack <- (new Stack) in
            {
                out_string("Testing isEmpty on new stack: ");
                if stack.isEmpty() then out_string("true\n") else out_string("false\n") fi;

                out_string("Pushing elements: 1, \"hello\", 42\n");
                stack.push(1);
                stack.push("hello");
                stack.push(42);
                stack.push((new Test));

                out_string("Printing stack: ");
                stack.print();

                out_string("Peeking top: ");
                case stack.peek() of
                    i : Int => out_int(i);
                    s : String => out_string(s);
                    o : Object => out_string(o.type_name());
                esac;
                out_string("\n");

                out_string("Popping top: ");
                case stack.pop() of
                    i : Int => out_int(i);
                    s : String => out_string(s);
                    o : Object => out_string(o.type_name());
                esac;
                out_string("\n");

                out_string("Printing stack after pop: ");
                stack.print();

                out_string("Popping remaining elements\n");
                stack.pop();
                stack.pop();
                stack.pop();

                out_string("Printing empty stack: ");
                stack.print();

                out_string("Testing isEmpty on empty stack: ");
                if stack.isEmpty() then out_string("true\n") else out_string("false\n") fi;

            };
            0;
        }
    };
};