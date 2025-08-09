🐋 Docker Lab - borazuwarahctf<br>
- Difficulty: Very Easy
- SO:Linux

🎯 Reconocimiento
1.- Empezamos con un reconocimiento con nmap:<br>
nmap -p- --open --min-rate 5000 -n -Pn -vvv 172.17.0.3 -oN scanning
- -p- -> Escanea todos los puertos (65535)
- --open -> Reporta unicamente los puertos abiertos
- --min-rate -> Envia paquetes no minimos a 5000
- -n -> No aplica resolucion DNS
- -Pn -> Asume que todos los hosts se encuentran activos
- -vvv -> Triple verbose, detalla cada puertos descubierto.
- -oN Output normal  
![RECONOCIMIENTO](./images/boraz8/nmap.png)

2.- Observamos que tiene 2 puertos expuestos<br>
- Puerto 22 [SSH]
- Puerto 80 [HTTP]
  Veamo la web para saber que puede aportarnos.
  ![WEB](./images/boraz8/web.png)
  
