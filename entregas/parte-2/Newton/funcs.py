import math

def func(x):    
    return math.exp(x) - (2 * math.cos(x))

def d_func(x):    
    return math.exp(x) + (2 * math.sin(x))

if __name__ == "__main__":
    pass