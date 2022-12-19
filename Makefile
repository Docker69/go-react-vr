#Original docker compose file execution
kong-postgres:
	COMPOSE_PROFILES=database KONG_DATABASE=postgres docker-compose up -d

kong-dbless:
	docker-compose up -d

clean:
	docker-compose kill
	docker-compose rm -f

#run stripped docker compose file to conform with Kompose
kong-dbless-x:
	docker-compose -f docker-compose-dbless-ks8.yml up -d

clean-x:
	docker-compose -f docker-compose-dbless-ks8.yml kill
	docker-compose -f docker-compose-dbless-ks8.yml rm -f

#Lunch converted K8S files
kong-dbless-convert-ks8:
#	kompose convert --volumes hostPath -f docker-compose-dbless.yml -o ./ks8
	kompose convert -f docker-compose-dbless-ks8.yml -o ./ks8
kong-dbless-run-ks8:
	kubectl apply -f ./ks8
kong-dbless-clean-ks8:
	kubectl delete -f ./ks8