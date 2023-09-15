import random

def polynomial_evaluation(n,x):
    sum = 0
    for n in range(n+1):
        sum = sum + (n * pow(x,n))
    return sum


n = random.randint(5,10)
x = random.randint(5,10)
res = polynomial_evaluation(n,x)

print(f"x: {x}, n: {n}, res: {res}")
