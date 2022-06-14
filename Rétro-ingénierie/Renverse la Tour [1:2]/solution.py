def tour1(password):
    string = str("".join( "".join(password[::-1])[::-1])[::-1])
    return [ord(c) for c in string]


def tour2(password):
    new = []
    i = 0
    while password != []:
        new.append(password[password.index(password[i])])
        new.append(password[password.index(password[i])] + password[password.index(password[ i + 1 %len(password)])])
        password.pop(password.index(password[i]))
        i += int('qkdj', base=27) - int('QKDJ', base=31) + 267500
    return new

def tour3(password):
    mdp =['l', 'x', 'i', 'b', 'i', 'i', 'q', 'u', 'd', 'v', 'a', 'v', 'b', 'n', 'l', 'v', 'v', 'l', 'g', 'z', 'q', 'g', 'i', 'u', 'd', 'u', 'd', 'j', 'o', 'r', 'y', 'r', 'u', 'a']
    for i in range(len(password)):
        mdp[i], mdp[len(password) - i -1 ] = chr(password[len(password) - i -1 ] + i % 4),  chr(password[i] + i % 4)
    return "".join(mdp)


def reverse_tour3(msg):
    l = [None]*34
    for i in range(len(msg)):
        l[len(msg)-i-1], l[i] = ord(msg[i])- i % 4, ord(msg[len(msg)-i-1]) - i % 4
    return l

def reverse_tour2(l):
    res = []
    for i, num in enumerate(l):
        if i%2 == 0:
            res.append(num)
    return res

def reverse_tour1(l):
    res = []
    for n in range(len(l)):
        res.append(chr(l[-n-1]))
    return "".join(res)
        
        
msg = "¡P6¨sÉU1T0d¸VÊvçu©6RÈx¨4xFw5"

print(reverse_tour1(reverse_tour2(reverse_tour3(msg))))
