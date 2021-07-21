import math

def func(x):    
    return math.exp(x) - (4 * (x ** 2))

def d_func(x):    
    return math.exp(x) - (8 * x)

if __name__ == "__main__":
    pass