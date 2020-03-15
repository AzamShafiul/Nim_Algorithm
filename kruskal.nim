import "weighted_graph"
type
  distancegraph = object
     src:int
     dis:int
     wgt:int
  treeEdges = object
      src:int
      dis:int
      inset:bool    

var 
  heap_size=0
  harr:seq[distancegraph]
  treearr:seq[treeEdges]
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
  
  
  while i!=0 and harr[parent(i)].wgt > harr[i].wgt: 
       var tmp=harr[i]
       harr[i]=harr[parent(i)]
       harr[parent(i)]=tmp
       echo "checkswap",harr[i].wgt," ",harr[parent(i)].wgt,"p"
       i=parent(i)


proc makeheap(i:int) =
  var l=(2*i)+1
  var r=(2*i)+2 
  var small=i
  if l<heap_size and harr[l].wgt<harr[i].wgt:
     small=l
  if r<heap_size and harr[r].wgt<harr[small].wgt:
     small=r
  if small != i:
     var tmp=harr[i]
     harr[i]=harr[small]
     harr[small]=tmp
     makeheap(small)
proc extractmin(): object =
   if(harr.len == 0):
    result=harr[0]
   var root=harr[0]  
   harr[0]=harr[heap_size-1]   
   heap_size=heap_size-1
   makeheap(0)
   result=root

var G:SimpleGraph[int]=SimpleGraph[int]()
var Gh:SimpleGraph[int]=SimpleGraph[int]()
G.initGraph()
Gh.initGraph()
G.addNode(0)
G.addNode(1)
G.addNode(2)

echo G.nodes()
G.addEdge(0,1,15)
Gh.addEdge(1,0,15)
G.addEdge(1,2,5)
Gh.addEdge(2,1,5)
G.addEdge(2,0,7)
Gh.addEdge(0,2,5)
echo G.edges(2)
for value in G.edges():
   var obj =distancegraph(src:value.src,dis:value.dst,wgt:value.weight)
   insertKey(obj)
echo harr
for i in 0..1:
  var tmp =extractmin()
  #treearr.add(extractmin())
  
  for val in treearr:
    if(val.src == tmp.src)
     

     


