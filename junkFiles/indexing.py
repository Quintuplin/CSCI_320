def insert(lista, value, index=-1):
    if index==-1:
        lista.append(value)
    else:
        lista.insert(index, value)
    print(lista)

insert([1,2,3], 1, 0)
insert([1,2,3], 1, 2)
insert([1,2,3], 1)


def insert2(lista, value, index=lambda lista:(len(lista))):
    try:
        int(index)
        lista.insert(index, value)
    except:
        lista.insert(index(lista), value)
    print(lista)

insert2([1,2,3], 1, 0)
insert2([1,2,3], 1, 2)
insert2([1,2,3], 1)