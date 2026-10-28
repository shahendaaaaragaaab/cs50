while True:
    try:
        n = int(input("Height: "))
        if 1 <= n <= 8:
            break
    except:
        pass
for i in range(n):
    o = 0
    while o < n-i-1:
        print(" ", end="")
        o += 1
    k = 0
    while k <= i:
        print("#", end="")
        k += 1
    print()
