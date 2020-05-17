def sortSecond(val): 
    return val[1]  

user_input = raw_input("Enter the path of your file: ")


alp = "ABCDEFGHIJKLMNOPRSTUVWXYZ"
arr = []

with open(user_input, 'r') as file:
    text = file.read()

text = text.upper()

for line in alp:  
    for ch in line: 
        arr.append((ch, text.count(ch)))

arr.sort(key=sortSecond, reverse=True) 

d0 = [x[0] for x in arr]
d1 = [x[1] for x in arr]
d1Sum = sum(d1)
d2 = [str(round(float(x)*100/d1Sum, 2))+'%' for x in d1]

for i in range(len(arr)): 
    print d0[i], "\t", d1[i], "\t", d2[i]