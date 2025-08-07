🐋 Docker Lab - First hacking
Difficulty: Very easy
SO: Linux

#🎯 Reconocimiento
1.- Empezamos lanzando un escaneo con nmap<br>
nmap -p- --open -T5 -n -Pn 172.17.0.2 
- -p- -> Escanea todos los puertos (0-65535)
- --open -> Muestra todos los puertos abiertos, imporante recalcar que muestra unicamente los puertos abiertos
- -T5 -> Planilla de tiempo, en este caso elegimos la mas agresiva ya que estamos en local.
- -n -> Para que no ejecute resolucion DNS
- -Pn -> Asume que todos los host de una red se encuentran encendidos.
![NMAP](./images/FH/nmap.png)<br>
