# Mise à Jour Requise

> Le writeups complet est disponnible au fichier [message.py](/R%C3%A9tro-ing%C3%A9nierie/Mise%20%C3%A0%20Jour%20Requise/message.py). ici sont détaillées les bribes d'explications du résonnement.

On commence par regarder la condition qui permet d'afficher le flag :

```Python
if c(b(input("password:"), 1)):
    print("Utilise ce mot de passe pour valider le challenge!")
else:
    print("Essaye Encore!")
```

la condition pour afficher le flag porte sur une fonction **`b`** et une fonction **`c`** qui retournent un booléen.

---

## Fonction b

```Python
def b(p, n):
    match list(p):
        case []:
            return []
        case [f, *rest]:
            l = list(a(f).values()) + b(''.join(rest), n*2)
            rd.seed(n)
            rd.shuffle(l)
            return l
```

La fonction **`b`** prend en paramètre:

- une chaine de caractère
- un nombre.

Elle fait appel à la fonction **`a`** pour chaque caractère de la chaine de caractère.

---

### Fonction a

```Python

def a(c, r=True):
    n = ord(c)
    if r: rd.seed(n)
    match n:
        case 0:
            return dict.fromkeys(range(10), 0)
        case _:
            return (d:=a(chr(n - 1), False)) | {(m:=rd.randint(0, 9)): d[m] + rd.randint(0,2)}
```

On remarque que la fonction **`a`** exploite la fonction seed de la bibliothèque **`random`** pour générer un nombre aléatoire.

celà modifie la valeur retournée par lafonction à chaque initialaisation.

Il est donc opportun de générer un dictionnaire de valeurs aléatoires pour chaque caractère de la chaine de caractère.

```Python
def gendict():
    alp = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890{}_.!'
    dict = {}
    for i in range(len(alp)):
        let = alp[i]
        dict = dict | { str(list(a(let).values())): let }
    return dict
```

ce qui nous permet d'écrire une première fonction réciproque de **`a`** dans laquelle on utilise la fonction **`gendict`** pour générer un dictionnaire à la bonne seed.

```Python
def una(lsts):
    res = ''
    count = len(lsts)
    dict = gendict()
    for i in range(count):
        try:
            res += dict[str(lsts[i])]
        except:
            print('e', lsts[i], ':::', i)
    return res
```

---

### Fonction unshuffle

On crée une fonction qui observe pour une seed donnée la façon dont la fonction **`shuffle`** permute les éléments de la liste.

on peut ensuite permuter les éléments dans l'odre opposé.

```Python
def unshuffle(lst, seed):
    rindexes = list(range(len(lst)))
    rd.seed(seed)
    rd.shuffle(rindexes)
    dec = [ i - rindexes.index(i) for i in rindexes ]
    unshuffle = [ 0 for i in range(len(lst)) ]
    for i in range(len(lst)):
        unshuffle[i + dec[i]] = lst[i]
    return(unshuffle)
```

---

### Fonction réciproque de la fonction **`b`**

La fonction **`b`** est une fonction récursive sur chaque élément de la liste. grâ ce à al fonction **`unshuffle`**, on peut remélanger la liste dans son ordre initial quelque soit la seed de **`random`**.

```Python
def unb(p):
    lists = []
    count = len(p)//10
    for i in range(count):
        tmp = unshuffle(p, (2**i))
        lists.append(tmp[:10])
        p = tmp[10:]
    return lists
```

---

## Fonction c

On a dès à présent réussi à rétro-ingénier la fonction **`b`**.
Il reste la fonction **`c`** qui permet de vérifier si la chaine de caractère est correcte.

```Python
def c(p, n=0):
    match p:
        case []:
            return n!=0
        case [f, *rest]:
            rd.seed(s[n])
            return rd.randint(0,30) == f and c(rest, n + 1)

```

On observe que la fonction change simplement la seed de **`random`** pour chaque caractère de la chaine de caractère.

on peut alors écrire :

```Python
def unc(n):
    p = [i for i in range(n)]
    for i in range(n):
        rd.seed(s[i])
        p[i] = rd.randint(0,30)
    return p
```

---

## Conclusion

on peut alors appeler les fonctions qui nous donnent le flag :

```Python
>>> print(una(unb(unc(len(s)))))
404CTF{M3RC1_PY7H0N3.10_P0UR_L3_M47CH}
```
