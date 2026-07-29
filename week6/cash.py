from cs50 import get_float

while True:
    try:
        d = get_float("change: ")
        if d > 0:
            break
    except:
        pass
d = round(d*100)
i = 0
while (d >= 25):
    d = d-25
    i += 1
o = 0
while (d >= 10):
    d = d-10
    o += 1
p = 0
while (d >= 5):
    d = d-5
    p += 1

l = 0
while (d >= 1):
    d = d-1
    l += 1

print(i+o+p+l)
