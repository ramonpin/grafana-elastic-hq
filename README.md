Grafana + Elasticsearch + ElasticHQ
===================================
Entorno de ejemplo para creación de dashboards con Grafana usando
como fuente de datos Elasticsearch.

Se incorpora al sistema ElasticHQ para monitorizar y ejecutar consultas
en Elasticsearch.

Las tareas disponibles son:

  - start             : Inicializa todo.
  - destroy           : Destruye todo.

  - elastic-start     : Inicializa el contenedor de elastic.
  - elastic-destroy   : Destruye el contenedor de elastic.

  - elastichq-install : Instala el plugin ElasticHQ en elastic.
  - create-index      : Crea el índice llamado cassandra.

  - grafana-start     : Inicializa el contenedor de grafana conectado a elastic.
  - grafana-destroy   : Destruye el contenedor de grafana.

  - open-hq           : Abre el navegador en ElasticHQ.
  - open-grafana      : Abre el navegador en Grafana.

