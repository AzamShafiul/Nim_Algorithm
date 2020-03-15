import lists
var head = initSinglyLinkedList[int]()


proc push(value:int)=
    var tmp=head.tail
    var node = SinglyLinkedNode[int]()
    node.value=value
    node.next=tmp
    head.tail=node
proc pop()=
    var list=head.tail
    echo list.value
    head.tail=head.tail.next


push(50)
push(20)
push(30)
pop()
pop()
push(70)
push(10)
pop()


         



    

