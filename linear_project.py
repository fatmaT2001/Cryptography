import numpy as np

Letter = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O",
          "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
Number = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14,
          15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25]


def encryption(a, x):
    alist = []
    newlist = []
    nlist = []
    # for turning the input to list
    for i in a:
        alist.append(i)
    for j in range(len(alist)):
        for i in range(len(Letter)):
            # print(alist[j], Letter[i])
            if alist[j] == Letter[i]:
                newlist.append(Number[i])

    if x == 1:
        key = [[6, 24, 1], [13, 16, 10], [20, 17, 15]]
    else:
        key = [[8, 5, 10], [21, 8, 21], [21, 12, 8]]

    finalarray = np.dot(key, newlist)
    for i in range(len(finalarray)):
        while finalarray[i] >= 26:
            finalarray[i] -= 26

    for j in range(len(finalarray)):
        for i in range(len(Number)):
            # print(alist[j], Letter[i])
            if finalarray[j] == Number[i]:
                nlist.append(Letter[i])

    return "".join(nlist)


def encryptionfourword(a, x):
    alist1 = []
    alist2 = []
    alist1n = []
    alist2n = []
    nlist1 = []
    nlist2 = []
    for i in range(4):
        if i > 1:
            alist2.append(a[i])
        else:
            alist1.append(a[i])
    # print(alist1)
    # print(alist2)

    for j in range(len(alist1)):
        for i in range(len(Letter)):
            # print(alist[j], Letter[i])
            if alist1[j] == Letter[i]:
                alist1n.append(Number[i])
    for j in range(len(alist2)):
        for i in range(len(Letter)):
            # print(alist[j], Letter[i])
            if alist2[j] == Letter[i]:
                alist2n.append(Number[i])
    # print(alist1n)
    # print(alist2n)
    if x == 1:
        key = [[3, 3], [2, 5]]
    else:
        key = [[15, 17], [20, 9]]

    finalarray1 = np.dot(key, alist1n)
    for i in range(len(finalarray1)):
        while finalarray1[i] >= 26:
            finalarray1[i] -= 26
    for j in range(len(finalarray1)):
        for i in range(len(Number)):
            # print(alist[j], Letter[i])
            if finalarray1[j] == Number[i]:
                nlist1.append(Letter[i])
    finalarray2 = np.dot(key, alist2n)
    for i in range(len(finalarray2)):
        while finalarray2[i] >= 26:
            finalarray2[i] -= 26
    for j in range(len(finalarray2)):
        for i in range(len(Number)):
            # print(alist[j], Letter[i])
            if finalarray2[j] == Number[i]:
                nlist2.append(Letter[i])
    nlist1 = "".join(nlist1)
    nlist2 = "".join(nlist2)

    finalarray = [nlist1, nlist2]
    return "".join(finalarray)


boo = "YES"
while boo == "YES":
    a = input("enter your word")
    c = 0
    for i in a:
        c += 1

    ask = int(input("enter 1 if you want to encrypt and 2 if you want to decrypt"))
    if c == 3:
        if ask == 1:
            print(encryption(a, 1))
        else:
            print(encryption(a, 2))
    elif c == 4:
        if ask == 1:
            print(encryptionfourword(a, 1))
        else:
            print(encryptionfourword(a, 2))

    boo = input("do you want to try again")
