proc minkey(key:array[5,int],mstSet:array[5,bool]): int =
    var 
        min_index:int
        min=999999
    for i in 0..4:  
       if mstSet[i] == false and key[i] < min:
          min =key[i]
          min_index =i
    return min_index  
proc printMST(parent:array[5,int],graph: array[0..4, array[0..4, int]])=
    for i in 1..4:
        var ind=parent[i]
        echo parent[i],i,graph[i][ind]
proc primMST(graph: array[0..4, array[0..4, int]])=
    var 
        parent:array[5,int]
        key:array[5,int]
        mstSet:array[5,bool]
    for i in 0..4:
        key[i] = 99999999
        mstSet[i] = false  
           
    
    key[0] = 0; 
    parent[0] = -1
    for i in 0..4:
       var u= minkey(key,mstSet)
       mstSet[u]=true
       for i in 0..4:  
         if graph[u][i] > 0 and mstSet[i] == false and graph[u][i] < key[i]:
              parent[i]=u
              key[i]=graph[u][i] 
    printMST(parent,graph)          
var graph=[[0, 2, 0, 6, 0],[ 2, 0, 3, 8, 5],[ 2, 0, 3, 8, 5],[ 6, 8, 0, 0, 9 ],[0, 5, 7, 9, 0 ]]
primMST(graph)
