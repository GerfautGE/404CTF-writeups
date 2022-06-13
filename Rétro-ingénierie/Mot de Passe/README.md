On commence par décompiler [le fichier fourni](./Mdp.class) à l'aide d'un décompilateur en ligne : 

qui donne la fonction ***hide***

```Java
    static String hide(String string) {
        String object = "";
        for (int i = 0; i < string.length(); ++i) {
            char c = string.charAt(i);
            c = (char)(c - i);
            c = (char)(c % 128);
            object = (String)object + c;
        }
        return object;
    }
```

on peut assez simplement écrire une **fonction réciproque** : 

```Java
    static String unhide(String string) {
        String object = "";
        for (int i = 0; i < string.length(); ++i) {
            char c = string.charAt(i);
            c = (char)(c + i);
            c = (char)(c % 128);
            object = (String)object + c;
        }
        return object;
    }
```


en éxécutant :
```Java

System.out.println(unhide("4/2@PAu<+ViNgg%^5NS`#J\u001fNK<XNW(_"))
```

on découvre : 
>404CTF{C3_sYst3mE_es7_5ecUrisE}