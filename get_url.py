with open('service.txt', 'rt') as file:
    next(file)
    print(next(file).split()[3])
    