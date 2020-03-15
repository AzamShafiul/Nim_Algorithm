import lists
var a = initSinglyLinkedList[int]()

var b = SinglyLinkedNode[int]()
var c = SinglyLinkedNode[int]()
var d = SinglyLinkedNode[int]()
var e = SinglyLinkedNode[int]()

b.value=4
c.value=8
d.value=16
e.value=32
a.tail=b
b.next=c
c.next=d
d.next=e

proc showlist(arguments:SinglyLinkedList) =
     var list=arguments.tail
     while list != nil:
         echo  list.value
         list=list.next
    
showlist(a)

