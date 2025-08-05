# 🧪 Análisis del Laboratorio Docker

## 📌 Objetivo

Describir el comportamiento de contenedores Docker en un entorno controlado y analizar su desempeño bajo diferentes condiciones.

---

## 🧰 Herramientas utilizadas

- Docker v24.0
- Imagen utilizada: `nginx:latest`
- Sistema operativo: Ubuntu 22.04 LTS
- Herramientas de monitoreo: `docker stats`, `top`, `ab (Apache Benchmark)`

---

## 🔍 Metodología

1. Se lanzaron tres contenedores con la imagen `nginx`.
2. Se configuraron diferentes puertos de exposición.
3. Se aplicó carga mediante herramientas de benchmark.
4. Se registraron estadísticas de CPU, memoria y latencia.

---

## 📊 Resultados

| Contenedor | CPU (%) | Memoria (MB) | Latencia promedio (ms) |
|------------|---------|---------------|-------------------------|
| nginx-1    | 5.2     | 64            | 150                     |
| nginx-2    | 12.8    | 80            | 180                     |
| nginx-3    | 3.6     | 45            | 130                     |

---

## 📈 Conclusiones

- El contenedor `nginx-2` presentó mayor consumo debido a logging activo.
- La eficiencia de Docker fue notable en escenarios de carga moderada.
- Se recomienda seguir con pruebas en entorno real.

---

## 📁 Archivos relacionados

Ninguno. Toda la información se encuentra documentada en este archivo.

---

## 🧹 Limpieza post-lab

```bash
docker stop nginx-1 nginx-2 nginx-3
docker rm nginx-1 nginx-2 nginx-3

![Descripción de la imagen](./images/docker-setup.png)
