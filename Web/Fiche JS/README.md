# Fiche JS

On se connecte au [site](https://fiche-js.404ctf.fr/) fourni dans l'énnoncé.

On repère dans le code source une fonction étrange :  une suite de HahahHAha... qui se transforme en suite de parenthèses, acolades et points d'exclamation.

Suite à quelques recherches, on trouve qu'il s'agit d'un langage de programmation [Javascript obfusqué](http://www.jsfuck.com)

après desobfuscation on obtient le code javascript suivant:

```javascript
function anonymous() {
/* FONCTIONNEMENT */
var key = $(".keypad").keypad(function (pin) {
  if (pin == "240801300505131273100172") {
    document.location.href = "./nob03y_w1lL_Ev3r_fiNd_th15_PaGe.html";
  }
});
}
```

on obtient donc : 

- le code pin : `240801300505131273100172`
- le code de la page : `./nob03y_w1lL_Ev3r_fiNd_th15_PaGe.html`

en se connectant sur cette [page](https://fiche-js.404ctf.fr/nob03y_w1lL_Ev3r_fiNd_th15_PaGe.html) :

on obtient une simple page HTML contenant le flag :
>404CTF{Haha_J3_5ui$_f4N_dObfu5c4tIoN_en_JS}