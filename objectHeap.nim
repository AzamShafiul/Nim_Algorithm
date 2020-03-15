type
    distancegraph = object
       nod:int
       dis:int
var 
    heap_size=0
    harr:seq[distancegraph]
    i:int
proc parent(i:int):int =
    var val=(i-1) div 2
    #[echo "par"
    echo val]#
    result=val

proc insertKey(val:object)=
    
    heap_size=heap_size+1
    i=heap_size-1
    #echo "i",i
    harr.add(val)
    
    #echo "harr[i]",harr[i]
    
    
    while i!=0 and harr[parent(i)].dis > harr[i].dis: 
         var tmp=harr[i]
         harr[i]=harr[parent(i)]
         harr[parent(i)]=tmp
         echo "checkswap",harr[i].dis," ",harr[parent(i)].dis,"p"
         i=parent(i)


proc makeheap(i:int) =
    var l=(2*i)+1
    var r=(2*i)+2 
    var small=i
    if l<heap_size and harr[l].dis<harr[i].dis:
       small=l
    if r<heap_size and harr[r].dis<harr[small].dis:
       small=r
    if small != i:
       var tmp=harr[i]
       harr[i]=harr[small]
       harr[small]=tmp
       makeheap(small)
proc extractmin(): object =
     var root=harr[0]  
     harr[0]=harr[heap_size-1]   
     heap_size=heap_size-1
     makeheap(0)
     result=root
var obj=distancegraph(nod:0,dis:3)
insertKey(obj)
obj=distancegraph(nod:1,dis:2) 
insertKey(obj)
     
obj=distancegraph(nod:2,dis:1) 
insertKey(obj)      
obj=distancegraph(nod:3,dis:15) 
insertKey(obj)
echo "as",extractmin() 
obj=distancegraph(nod:4,dis:5) 
insertKey(obj)
obj=distancegraph(nod:5,dis:14) 
insertKey(obj)
echo "as",extractmin()
obj=distancegraph(nod:6,dis:45) 
insertKey(obj)
obj=distancegraph(nod:7,dis:15) 
insertKey(obj)
echo extractmin()      
echo extractmin()
echo extractmin()      
echo extractmin()    
