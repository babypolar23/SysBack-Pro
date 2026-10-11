# SysBack-Pro
—-
**SysBackup-Pro** es una herramienta de automatización en Bash diseñada para crear respaldos comprimidos de manera rápida, segura y modular en sistemas Linux, poder tener tu información y datos de manera segura y organizada.

---

## 🚀 Características:
* **Modularidad:** Construido utilizando funciones independientes en Bash.
* **Flexibilidad:** Recibe rutas de origen y destino mediante argumentos dinámicos de terminal (`$1`, `$2`).
* **Compresión:** Genera archivos empaquetados `.tar.gz` etiquetados automáticamente con fecha y hora.
* **Verificación:** Valida de forma automática la existencia del archivo generado.
* **Facilidad y Orden:** Ahorra tiempo al reutilizar bloques de código mediante funciones sin repetir comandos, además de darle un mayor orden.

---
##Funcionamiento:
* **Uso e Instrucciones (`$0`):** Enseña al usuario la sintaxis correcta desde la terminal:
  `./SysBackup-Pro.sh <carpeta_a_respaldar> <destino_del_respaldo>`

* **Variables Globales Dinámicas:** 
  Uso de `$1` y `$2` para capturar argumentos externos de la terminal:
  * `CARPETA_ORIGEN="$1"`
  * `DESTINO_BACKUP="$2"`
  * `FECHA=$(date +%Y-%m-%d_%H-%M-%S)`
  * `NOMBRE_ARCH="backup_$FECHA.tar.gz"`

* **Función `crear_respaldo()`:** 
  Empaqueta y comprime la carpeta seleccionada usando el comando:
  `tar -czf "$DESTINO_BACKUP/$NOMBRE_ARCH" "$CARPETA_ORIGEN"`

* **Función `verificar_respaldo()`:** 
  Comprueba mediante una estructura condicional `if/else` con el parámetro `-f` si el archivo comprimido se creó con éxito.

* **Bloque Principal:** 
  Manda llamar a las funciones en orden (`crear_respaldo`, `verificar_respaldo`) para mantener un flujo limpio y fácil de mantener.

——
<details>
<summary><b>📖 Haz clic aquí para leer el desglose detallado paso a paso</b></summary>

<br>
##Explicación detallada del código (Arquitectura):
* **Comenzamos con ayudar al usuario, enseñando el uso, para facilitar su uso dentro de la terminal. (`Uso: ./SysBackup-pro.sh <carpeta_a_respaldar> <destino_del_respaldo>`).
* **Comenzamos creando las variables globales para el respaldo, y para que sea dinámico, con el uso de variables tipo "`$1`", siendo que `$1 y $2` son los textos después del nombre de fichero, y siendo `$0` el nombre del fichero. (`CARPETA_ORIGEN="$1" ; DESTINO_BACKUP="$2" ; FECHA=$(date +%Y-%m-%d_%H-%M-%S) ; NOMBRE_ARCH="backup_$FECHA.tar.gz"`).
* **Comenzamos con la creación de la primera función ( `crear_respaldo() {` ), para poder hacer un mini-script dentro del script, para tener un mejor orden, además de que su uso, es para comprimir y empaquetar la carpeta, haciendo uso de los comandos de echo, para darle interactividad y entendimiento al script (`echo "[INFO] Iniciando compresión de la carpeta: $CARPETA_ORIGEN"`), y el comando `tar` con el parámetro "`-czf`" para comprimir (`tar -czf "$DESTINO_BACKUP/$NOMBRE_ARCH" "$CARPETA_ORIGEN"`), posteriormente con un echo, para efectos de interactividad y entendimiento del usuario. (`echo "[INFO] Respaldo guardado en: $DESTINO_BACKUP/$NOMBRE_ARCH"`), para posteriormente cerrar la función con "`}`" y seguir con el script.
* **Comenzamos con la creación de la segunda función ( `verificar_respaldo() {` ), para poder verificar que el archivo realmente se creó, y hacer de su uso de manera correcta, para esto, hacemos uso de los comandos if/else, con el parámetro "`-f`" que nos indica que buscará el fichero correspondiente, y en dado caso de que se encuentre el fichero o no se encuentre se lanzará un mensaje con echo, dependiendo de si lo encontró o no. (`if [ -f "$DESTINO_BACKUP/$NOMBRE_ARCH" ] ; then     else`); posteriormente cerramos el if/else con "`fi`" y cerramos la segunda función con "`}`".
* **Comenzamos con echo para la interactividad y facilidad del usuario, para que nos indique que está iniciando el sistema, es decir el, "`SYSBACKUP-PRO`"
* **Posteriormente efectuamos e implementamos las funciones, mandando a llamar a nuestras funciones en orden, al hacer esto, no tenemos que escribir todos los comandos de nuevo, con tan solo escribir las funciones, se efectúa y se tiene un mayor orden. (`crear_respaldo` ; `verificar_respaldo`).
* **Finalizamos con un echo, para efectos de interactividad y facilidad del usuario, imprimiendo que el proceso ha finalizado.
/details>
—-

## 🛠️ Requisitos Previos

* **Sistema Operativo basado en Linux / Unix.
* **Intérprete de shell bash.
* **Herramienta estándar tar.

---

## 💻 Uso e Instalación

**Clonar el repositorio:**


Desarrollado por Gustavo Islas.
