
import simple_graph
var G: SimpleGraph[int] = SimpleGraph[int]()
var visited:seq[bool]

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

for index in 0..4-1:
    visited.add(false)


proc dfs(first:int)=
    
    visited[first]=true    
    echo first
    for index in G.edges(first):
        if visited[index.dst]==false:
           visited[index.dst]=true
           dfs(index.dst)
dfs(2)
  
    
    
        
    
   





