#!/bin/bash

resposta_http=$(curl --write-out %{http_code} --silent --output /dev/null http://localhost)
echo $resposta_http
if [ $resposta_http -ne 200 ]
then
mail -s "Problema no servidor" adrianorrocha18@gmail.com<<del
Houve um problema no servidor e os usuarios pararam de ter acesso ao conteudo web 
del
    systemctl restart apache2
    echo "...Servidor reinicializando"
fi