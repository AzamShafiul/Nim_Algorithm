import lists
var head = initSinglyLinkedList[int]()
var tails = SinglyLinkedNode[int]()
var c=0
proc enqueue(val:int)=
    if c == 0:
      tails.value=val
      head.tail=tails
      inc(c)
    else:  
      var tmp=tails 
      tails= SinglyLinkedNode[int]()
      tails.value=val
      tmp.next=tails
      inc(c)
      

proc dequeue(): int=
    var list=head.tail
    head.tail=head.tail.next
    result=list.value
    

       

enqueue(50)
enqueue(20)
enqueue(30)
enqueue(30)

echo dequeue()
echo dequeue()
