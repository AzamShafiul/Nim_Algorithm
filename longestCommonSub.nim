proc lcs( X:string, Y:string, m:int, n:int ):int= 
  
    var L:array[0..7,array[0..8,int]]
    
      
    
    for i in 0..m:  
      
        for j in 0..n: 
          
          if (i == 0 or j == 0):  
             L[i][j] = 0;  
      
          elif (X[i - 1] == Y[j - 1]):  
             L[i][j] = L[i - 1][j - 1] + 1;  
      
          else:
            L[i][j] = max(L[i - 1][j], L[i][j - 1]);  
          
      
          
    
    
    return L[m][n];  
  
  

proc max(a:int, b:int): int=  
     if a>b:
        return a
     return b   
      
 
var X="AGGTAB"

var Y= "GXTXAYB"
  
var m = X.len
var n = Y.len  
echo lcs( X, Y, m, n )