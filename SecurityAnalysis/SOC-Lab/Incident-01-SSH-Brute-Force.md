Objetivo: Simular ataque de Fuerza Brutaa un servidor mediante SSH, desde Windows hacia Ubuntu.

Fase 1.
Verificar SSH en ubuntu
sudo systemctl status ssh 
<img width="1452" height="579" alt="imagen" src="https://github.com/user-attachments/assets/630ce4fc-8aa5-422e-b468-a42d94447b50" />
Confirma la IP del ubuntu.
<img width="926" height="412" alt="imagen" src="https://github.com/user-attachments/assets/4c4647c8-1146-40df-90e9-7fc827d11548" />
Verificar conexion SSH.
<img width="625" height="232" alt="imagen" src="https://github.com/user-attachments/assets/90326444-77c6-4e02-a933-9d3d0f013703" />

Fase 2. - Ataque controlado
*Ejecutar varias veces la conexion por ssh*
ssh userrandom@192.168.174.137
<img width="827" height="355" alt="imagen" src="https://github.com/user-attachments/assets/f2c2f025-dc15-47ba-9c61-365a0059c1da" />

Fase 3. - Deteccion (WAZUH)
sudo tail -f /var/log/auth.log
<img width="912" height="502" alt="imagen" src="https://github.com/user-attachments/assets/414a7000-e9e8-405d-a0eb-cf91cdc20603" />
Como vemos en el log "Failed password for invalid user" (Evidencia tecnica)

Fase 4. - Alerta en Wazuh
<img width="1896" height="337" alt="imagen" src="https://github.com/user-attachments/assets/0bb7a809-e553-4b6c-93f7-5bd9532696d3" />

Fase 5. - Análisis SOC (Documentación)
Incident Sumary:
 - Type: SSH Brute Force
 - Source IP: <img width="479" height="45" alt="imagen" src="https://github.com/user-attachments/assets/7083a77e-88dd-4ad0-8ede-e0536aa582c6" />
 - <img width="431" height="119" alt="imagen" src="https://github.com/user-attachments/assets/d11420f4-3bc3-405c-bb36-93309394e438" />

MITRE ATT&CK
 - Tactic: Credential Access
 - Technique: Brute Force (T1110)
<img width="636" height="115" alt="imagen" src="https://github.com/user-attachments/assets/b766f4d7-3f7b-4cef-b4cb-0ccffe2e9ddb" />

NIST Phase
 - Detection & Analysis

Evidence
 - /var/log/auth.log
<img width="1703" height="284" alt="imagen" src="https://github.com/user-attachments/assets/30475717-ef5f-4b6f-acfd-7d7bffb9990b" />
 - Wazuh alert ID
<img width="1902" height="181" alt="imagen" src="https://github.com/user-attachments/assets/e662afef-b542-4b3e-ada5-776643f7845b" />

Impact
 - No succesful login
 - No privilige escalation

Response (SOC L1)
 - Monitor further attempts
 - Recommend IP block if persists
 - Escalate to SOC L2 if threshold exceeded
