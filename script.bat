echo "Criando as imagens..."

docker build -t vieira/projeto-backend:1.0 backend/.
docker build -t vieira/projeto-database:1.0 database/.

echo "Ralizando o push das imagens..."

docker push vieira/projeto-backend:1.0
docker push vieira/projeto-database:1.0

echo "Criando serviços no cluster kubernetes..."

kubctl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployments.yml
