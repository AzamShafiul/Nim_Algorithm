import "weighted_graph"
import sequtils

type
    distancegraph = object
        nod: int
        dis: int
var dis: seq[int]        
var
    heap_size = 0
    harr: seq[distancegraph]
    i: int
proc parent(i: int): int =
    var val = (i-1) div 2

    result = val

proc insertKey(val: object) =

    heap_size = heap_size+1
    i = heap_size-1

    echo "val", val
    harr.add(val)

    while i != 0 and harr[parent(i)].dis > harr[i].dis:
        var tmp = harr[i]
        harr[i] = harr[parent(i)]
        harr[parent(i)] = tmp
        echo "checkswap", harr[i].dis, " ", harr[parent(i)].dis, "p"
        i = parent(i)


proc makeheap(i: int) =
    var l = (2*i)+1
    var r = (2*i)+2
    var small = i
    if l < heap_size and harr[l].dis < harr[i].dis:
        small = l
    if r < heap_size and harr[r].dis < harr[small].dis:
        small = r
    if small != i:
        var tmp = harr[i]
        harr[i] = harr[small]
        harr[small] = tmp
        makeheap(small)
proc extractmin(): object =
    if heap_size == 1:
        var root = harr[0]
        heap_size = heap_size-1
        harr = @[]
        result = root
    else:

        var root = harr[0]
        echo "extract", harr
        harr[0] = harr[heap_size-1]
        heap_size = heap_size-1
        echo harr, "extract"
        makeheap(0)
        result = root

var G: SimpleGraph[int] = SimpleGraph[int]()
G.initGraph()
G.addNode(0)
G.addNode(1)
G.addNode(2)
G.addNode(3)
G.addEdge(0, 1 ,5) 
G.addEdge(0, 2 ,8) 
G.addEdge(1, 2,6) 
G.addEdge(2, 0,3) 
G.addEdge(2, 3,5) 

#echo G.edges(2)




proc initdist(i: int) =
    for index in 0..i:
        dis.add(999999999)
initdist(3)
proc shortestpath(src: int) =
    insertKey(distancegraph(nod: 0, dis: src))
    dis[src] = 0
    var jk=proc (x: int): bool =
         return x == 999999999
    var check = any(dis,jk)

    while (harr.len>0 or check == true):
        echo check
        echo "ha",harr.len
        var vertex:int
        
        vertex = extractmin().nod
        echo harr
        echo vertex
        for val in G.edges(vertex):
             
            var v = val.dst
            var w = val.weight
            echo "j", dis[v], "j", dis[vertex], "j", w
            if dis[v] > dis[vertex] + w:
                echo "disval", dis[vertex] + w
                dis[v] = dis[vertex] + w
                echo "v",v," ",dis[v]
                insertKey(distancegraph(nod: v, dis: dis[v]))
        check = any(dis,jk)
        echo check
        echo "len",harr.len
        if(harr.len == 0):
            harr = @[]
    for index in 0..3:
        echo dis[index]
shortestpath(0)


