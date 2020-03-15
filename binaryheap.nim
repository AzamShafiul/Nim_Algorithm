import sequtils,math

var 
    heap_size=0
    harr:seq[int]
    i:int
proc parent(i:int):int =
    var val=(i-1) div 2
    echo "par"
    echo val
    result=val
echo parent(0)    
proc insertKey(val:int)=
    
    heap_size=heap_size+1
    i=heap_size-1
    echo "i",i
    harr.add(val)
    
    echo "harr[i]",harr[i]
    
    
    while i!=0 and harr[parent(i)] > harr[i]: 
         var tmp=harr[i]
         harr[i]=harr[parent(i)]
         harr[parent(i)]=tmp
         echo "checkswap",harr[i]," ",harr[parent(i)],"p"
         i=parent(i)


proc makeheap(i:int) =
    var l=(2*i)+1
    var r=(2*i)+2 
    var small=i
    if l<heap_size and harr[l]<harr[i]:
       small=l
    if r<heap_size and harr[r]<harr[small]:
       small=r
    if small != i:
       var tmp=harr[i]
       harr[i]=harr[small]
       harr[small]=tmp
       makeheap(small)
proc extractmin(): int =
     var root=harr[0]  
     harr[0]=harr[heap_size-1]   
     heap_size=heap_size-1
     makeheap(0)
     result=root
insertKey(3) 
insertKey(2)

insertKey(1) 
insertKey(15) 
echo "as",extractmin()
insertKey(5) 
insertKey(14) 
echo "as",extractmin()
insertKey(45)
insertKey(15)  
echo "min"
echo extractmin()
echo extractmin()
echo extractmin()
echo extractmin()

echo "min"