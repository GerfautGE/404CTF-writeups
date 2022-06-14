# Stéréographie

J'ai longtemps cherché avant de trouver la solution.

- On dispose d'un [fichier .wav](message.wav)
- A l'écoute, on distingue clairement deux pistes très différentes.
- Les différents outils de Stéganographie classiques pour un fichier wav ne donnent rien. Pas de mauvaise construction, pas de LSB, rien.

- J'ai donc considéré une autre voix : analyser le fichier. J'ai essayé avec une vue spectrale et un filtre de fréquence. Mais celà n'a rien donné.

- En poussant un peu plus les recherches, j'ai trouvé un executable qui considère les pistes stéréo comme des canaux d'un oscilloscope.

cela donne une suite de caractères qui forment :

>404CTF{AV3Z_V0U5_U71L153_UN_VR41_05C1LL05C0P3}
