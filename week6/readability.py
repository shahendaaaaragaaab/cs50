from cs50 import get_string
text = get_string("Text: ")
mark = ['.', '?', '!']
h = 0
c = 1
x = 0
for i in text:
    if i.isalpha():
        h = h+1
    if i == " ":
        c = c+1
    if i in mark:
        x = x+1
l = (h/c)*100
s = (x/c)*100
z = 0.0588 * l - 0.296 * s - 15.8
if z < 1:
    print("Before Grade 1")
elif z >= 16:
    print("Grade 16+")
else:
    print(f"Grade {round(z)}")
