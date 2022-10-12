from sympy import exp

def f(x):
    result = exp(-x)
    return result

def float_input(text):
     while True:
         try:
             value = float(input(text))
             return value
         except Exception as exception:
             print(exception)

def fixed_point():
    x = [float_input("x0: ")]
    TC = float_input("TC: ")
    epsilon = []
    i = 1
    while True:
        x.append(f(x[i - 1]))
        epsilon.append(abs((x[i] - x[i - 1]) / x[i]) * 100)
        if epsilon[i - 1] < TC:
            return {"approximate root": x[i], "iterations": i}
        i += 1

if __name__ == "__main__":
    print(fixed_point())
    
