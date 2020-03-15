var graph =[[0, 5, 99999999, 10],[99999999, 0, 3, 99999999],[99999999, 99999999, 0, 1],[99999999, 99999999, 99999999, 0]]
var dis :array[0..4, array[0..4,int]]
proc warshall()=
    for i in 0..graph.len-1:
        for j in 0..graph.len-1:
            dis[i][j] = graph[i][j]
    for k in 0..graph.len-1:
      for i in 0..graph.len-1:
        for j in 0..graph.len-1:
           if dis[i][k] + dis[k][j] < dis[i][j]:
              dis[i][j] = dis[i][k] + dis[k][j] 
proc dist()=
    for i in 0..graph.len-1:
        for j in 0..graph.len-1:
            echo dis[i][j]  
warshall()
dist()            


    