info:
	@clear
	@echo "Infraestructura para el ejemplo de monitorización."
	@echo
	@echo "  start             : Inicializa todo."
	@echo "  destroy           : Destruye todo."
	@echo
	@echo "  elastic-start     : Inicializa el contenedor de elastic."
	@echo "  elastic-destroy   : Destruye el contenedor de elastic."
	@echo
	@echo "  elastichq-install : Instala el plugin ElasticHQ en elastic."
	@echo "  create-index      : Crea el índice llamado cassandra."
	@echo
	@echo "  grafana-start     : Inicializa el contenedor de grafana conectado a elastic."
	@echo "  grafana-destroy   : Destruye el contenedor de grafana."
	@echo
	@echo "  open-hq           : Abre el navegador en ElasticHQ."
	@echo "  open-grafana      : Abre el navegador en Grafana."
	@echo

start: elastic-start elastichq-install create-index grafana-start

destroy: grafana-destroy elastic-destroy

elastic-start:
	@docker run -d -p 9200:9200 --name elastic elasticsearch

elastic-destroy:
	@docker stop elastic
	@docker rm elastic

elastichq-install:
	@docker exec elastic plugin install royrusso/elasticsearch-HQ

create-index:
	@curl -XPUT http://localhost:9200/cassandra/ --data-binary @index.yml

grafana-start:
	@docker run -d -p 3000:3000 --name grafana \
                    -e "GF_SECURITY_ADMIN_PASSWORD=admin" \
                    --link elastic:elastic \
                    grafana/grafana 

grafana-destroy:
	@docker stop grafana
	@docker rm grafana

open-hq:
	@google-chrome http://localhost:9200/_plugin/hq 2> /dev/null

open-grafana:
	@google-chrome http://localhost:3000 2> /dev/null

