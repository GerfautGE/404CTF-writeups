# Pas de Mise à Jour ...

## Décompilation

On récupère un fichier [python compilé](chall.pyc).
on peut essayer de le décompiler proprement  avec un package comme [uncompyle6](https://github.com/rocky/python-uncompyle6/) mais le fichier python semble être écrit en *python 3.10* et en utiliser des fonctions particulieres (comme match/case ...). On ne peut pas le décompiler.

on peut cependant en obtenir le bytecode grâce à [pycdc](https://github.com/zrax/pycdc):

[bytecode.txt](bytecode.txt)

Avec un travail minutieux de reverse engineering du bytecode on peut retrouver le fichier source :

```Python
coded = [292,194,347,382,453,276,577,434,183,295,318,196,482,325,412,502,396,402,328,194,473,490,299,503,386,215,263,211,318,206,533]

key = 'd1j#H(&Ja1_2 61fG&'

userInput = [ ord(e) for e in input('Password:') ]

def code(l):
    match l:
        case [el, *rest]:
            return [5*el^ord(key[len(rest)%len(key)])]+code(rest)
            
        case []:
            return []
```

---

## Rétro-ingénierie
On remarque que le code se fonde principalement sur [l'opérateur booléen XOR](https://fr.wikipedia.org/wiki/Fonction_OU_exclusif). On peu en exploiter la propriété suivante :

```latex
(A^B)^B = A
```
Ainsi, on parvient à rédiger la fonction **`uncode`**

```Python
def uncode(l:list)->str:
    rest=[chr((533^ord(key[0]))//5)]
    for i in range(2,len(l)+1):
        j = -i
        s= chr((l[j]^ord(key[len(rest)%len(key)]))//5)
        rest = [s]+rest
    return ''.join(rest)
```


ce qui donne : 
>404CTF{R34D1NG_PYTH0N_BYT3C0D3}