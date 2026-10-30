# Consulta web de datos bursátiles

Proyecto del Taller 1 de **Despliegue de Servicios**. Consulta datos históricos de acciones mediante Yahoo Finance (`yfinance`) y los presenta en una página web servida por Flask. La aplicación también incluye un script de consola para consultar un símbolo bursátil.

## Requisitos

- Python 3.11 y pip, o Docker con Docker Compose.
- Conexión a Internet para consultar Yahoo Finance.

## Ejecución local

Instala las dependencias y ejecuta la aplicación web:

```bash
python -m pip install -r requirements.txt
python app.py
```

Abre [http://localhost:5000](http://localhost:5000). La ruta `/` muestra la tabla de datos de `GOOGL` desde el 1 de enero de 2020.

Para ejecutar la consulta desde la consola, indicando un símbolo:

```bash
python read_value_yf.py AMZN
```

Si no se indica un símbolo, el script utiliza `GOOGL`. La salida de consola contiene las últimas cinco filas disponibles.

## Ejecución con Docker Compose

Construye la imagen e inicia el servicio:

```bash
docker compose up --build -d
```

La aplicación queda disponible en [http://localhost:5001](http://localhost:5001). El puerto `5001` del equipo se redirige al puerto `5000` del contenedor.

Para ver los registros y detener el servicio:

```bash
docker compose logs -f app
docker compose down
```

También se pueden usar los objetivos del `Makefile`, por ejemplo `make build`, `make up` y `make down`.

## Ejecución solo del script en Docker

El `Dockerfile` inicia la aplicación Flask de forma predeterminada. Para ejecutar en su lugar el script de consola con `GOOGL`:

```bash
docker build -t stock-market:1.0 .
docker run --rm --entrypoint python3 stock-market:1.0 read_value_yf.py GOOGL
```

Reemplaza `GOOGL` por otro símbolo, como `AMZN`, según corresponda.

## Archivos principales

- `app.py`: servidor Flask y ruta web `/`.
- `read_value_yf.py`: consulta y presenta datos bursátiles.
- `requirements.txt`: dependencias de Python.
- `Dockerfile`: imagen y comando de inicio del contenedor.
- `docker-compose.yml`: servicio y mapeo del puerto `5001:5000`.
- `Makefile`: atajos para Docker Compose y formato de código.

> **Nota:** la consulta depende de la disponibilidad de Yahoo Finance y de la conexión a Internet. Los datos son informativos y no constituyen asesoría financiera.
