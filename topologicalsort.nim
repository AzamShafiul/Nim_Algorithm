import deques
import simple_graph
var G: SimpleGraph[int] = SimpleGraph[int]()
var q = initDeque[int]()
var visited:seq[bool]
 
G.initGraph()

G.addNode(0)
G.addNode(1)
G.addNode(2)
G.addNode(3)
G.addNode(4)
G.addNode(5)


G.addEdge(0, 1) 

G.addEdge(1,2) 
G.addEdge(1,4) 
G.addEdge(1,5) 
 
G.addEdge(2, 3) 
echo G.edges()
echo G.edges(1,false)

for index in 0..5:
    visited.add(false)
    
  
proc bfs(first:int)=
    
    visited[first]=true    
    echo first
    for index in G.edges(first):
        if visited[index.dst]==false:
           visited[index.dst]=true
           bfs(index.dst)
    q.addFirst(first)       
    
   
bfs(1)
echo q



