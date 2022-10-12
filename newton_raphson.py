from sympy import Symbol, diff, exp

def f(x):
    result = exp(-x) - x	
    return result

def f_prime(value):
    x = Symbol('x')
    y = (exp(-x) - x).diff(x)
    result = y.subs(x, value)
    return result
	
	
def float_input(text):
    while True:
        try:
            value = float(input(text))
            return value
        except Exception as exception:
            print(exception)

def newton_raphson():
    x = [float_input("x0: ")]
    TC = float_input("TC: ")
    epsilon = []
    i = 0
    while True:
         x.append(x[i] - f(x[i]) / f_prime(x[i]))
         epsilon.append(abs((x[i + 1] - x[i]) / x[i + 1]) * 100)
         if epsilon[i] < TC:
             return {"approximate root": x[i+1], "iterations": i}
             break
         i += 1

if __name__ == "__main__":
    print(newton_raphson())
    
