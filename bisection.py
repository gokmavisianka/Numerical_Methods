from math import exp

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

def bisection():
    xl = float_input("xl: ")
    xu = float_input("xu: ")
    TC = float_input("TC: ")
    if not (f(xl) * f(xu) < 0):
        print("f(xl) × f(xu) should be lower than zero.")
	bisection()
    else:
	epsilon = []
	xr = []
	i = 0
	while True:
	    xr.append((xl + xu) / 2)
	    temp = f(xl) * f(xr[i])
	    if temp > 0:
		xl = xr[i]
	    elif temp < 0:
		xu = xr[i]
	    if i > 0:
		epsilon.append(abs((xr[i] - xr[i - 1]) / xr[i]) * 100)
		if epsilon[i - 1] < TC:
		    print(f"approximate root: {xr[i]}, iterations: {i + 1}")
		    break
	    i += 1

bisection()
