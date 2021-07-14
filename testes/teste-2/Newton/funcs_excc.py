import math

def func(x):    
    e = math.exp(1)
    return 5 - (20 * ((e ** (-0.2 * x)) - (e ** (-0.75 * x))))

def d_func(x):    
    e = math.exp(1)
    return -20 * ((0.75 * (e ** (-0.75 * x))) - (0.2 * (e ** (-0.2 * x))))

if __name__ == "__main__":
    pass