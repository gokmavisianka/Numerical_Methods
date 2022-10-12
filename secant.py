from sympy import exp

def f(x):
    result = exp(-x) - x	
    return result
	
def float_input(text):
    while True:
        try:
            value = float(input(text))
            return value
        except Exception as exception:
            print(exception)

def secant():
    x = [float_input("x0: "), float_input("x1: ")]
    TC = float_input("TC: ")
    epsilon = []
    i = 1
    while True:
        x.append(x[i] - f(x[i]) * (x[i] - x[i - 1]) / (f(x[i]) - f(x[i - 1])))
        epsilon.append(abs((x[i + 1] - x[i]) / x[i + 1]) * 100)
        if epsilon[i - 1] < TC:
            return {"approximate root": x[i+1], "iterations": i}
            break
        i += 1

if __name__ == "__main__":
    print(secant())
