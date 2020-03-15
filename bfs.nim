import deques
import simple_graph
var G: SimpleGraph[int] = SimpleGraph[int]()
var q = initDeque[int]()
G.initGraph()

G.addNode(0)
G.addNode(1)
G.addNode(2)
G.addNode(3)
G.addEdge(0, 1) 
G.addEdge(0, 2) 
G.addEdge(1, 2) 
G.addEdge(2, 0) 
G.addEdge(2, 3) 
G.addEdge(3, 3) 
echo G.edges(0)
echo G.edges(1)


proc bfs(first:int,vertex:int)=
    var visited:seq[bool]
    for index in 0..vertex-1:
        visited.add(false)
        echo visited[index]
    visited[first]=true    
    q.addLast(first)  
    echo q  
    while q.len>0:
        var val=q.popFirst
        echo val
        for index in G.edges(val):
                if visited[index.dst]==false:
                        visited[index.dst]=true
                        q.addLast(index.dst)





bfs(2,4)
