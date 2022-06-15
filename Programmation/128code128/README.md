# 128code128

l'idée du challenge est de se connecter à un serveur netcat et d'executer des actions à partir d'une chaine de caractère, avant de lui renvoyer ce qu'il considère comme un mot de passe.

la solution entiere est rédigée dans le fichier [solution.py](solution.py).

les grandes étapes sont :

- connexion au serveur netcat
- récéption du code que l'on transforme en image.
- lecture de l'image
- interpretation grâce au [code128](https://fr.wikipedia.org/wiki/Code_128)
- envoi du mot de passe au serveur netcat

ces étapes sont effectuées 128 fois.

A la fin de cette boucle, le serveur netcat répond :

>404CTF{W0w_c0d3_128_4_pLUs_4uCuN_s3cr3t_p0urR_t01}