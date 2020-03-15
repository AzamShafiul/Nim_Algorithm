var arr = [10, 22, 9, 33, 21, 50, 41, 60]
var lis :array[8,int]
proc lincsub(n:int):int =
    lis[0]=1
    for i in 1..n-1:
        
        lis[i] = 1; 
        for j in 0..i-1:
            
            if arr[i] > arr[j] and lis[i] < (lis[j] + 1): 
                lis[i] = lis[j] + 1
                  
    
    result = max(lis)

echo lincsub(8)