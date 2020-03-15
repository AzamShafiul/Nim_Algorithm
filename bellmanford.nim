import weighted_graph
var G: SimpleGraph[int] = SimpleGraph[int]()
var
    dis:seq[int]
proc initdist(i: int) =
  for index in 0..i:
    dis.add(999999999)
proc Bellmanford(src:int,ver:int)=
     dis[src]=0
     for i in 0..ver-1:
        for val in G.edges():
          echo val  
          if dis[val.src] + val.weight < dis[val.dst]:
             dis[val.dst] =dis[val.src] + val.weight
     for val in G.edges():
            echo val  
            if dis[val.src] + val.weight < dis[val.dst]:
                echo "negative weighted cycle"
        
initdist(3)    

G.initGraph()
G.addNode(0)
G.addNode(1)
G.addNode(2)
G.addNode(3)
G.addEdge(0, 1,-5) 
G.addEdge(0, 2,8) 
G.addEdge(1, 2,-6) 
G.addEdge(2, 0,-3) 
G.addEdge(2, 3,-5) 
 
#echo G.edges(2)
Bellmanford(0,4)
for index in 0..3:
    echo dis[index]
    