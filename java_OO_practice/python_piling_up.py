with open('java_OO_practice/python_piling_up_data.txt', 'r') as data:
    # numtests = input()
    numtests = data.readline()

    for i in range(int(numtests)):
        # testlen = input()
        # unfiltered = input().split()

        testlen = data.readline()
        unfiltered = data.readline().split()

        decreasing = True
        isok = True
        prevval = int(unfiltered[0])
        for val in unfiltered:
            intval = int(val)
            if (decreasing):
                if (intval <= prevval):
                    prevval = intval
                else:
                    print('switch to increase')
                    print('prev:', prevval, 'val:', intval)
                    prevval = intval
                    decreasing = False
            else:
                if (intval >= prevval):
                    prevval = intval
                else:
                    print('decrease where should be increase')
                    print('prev:', prevval, 'val:', intval)
                    isok = False
                    break

        if (isok):
            print("Yes")
        else:
            print("No")