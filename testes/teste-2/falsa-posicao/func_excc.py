import math

def func(x):    
    e = math.exp(1)
    return 5 - (20 * ((e ** (-0.2 * x)) - (e ** (-0.75 * x))))

if __name__ == "__main__":
    func()