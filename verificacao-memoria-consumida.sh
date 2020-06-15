#!/bin/bash

memoria_total=$(free | grep -i mem | awk '{print $2}')
memoria_consumida=$(free | grep -i mem | awk '{print $3}')

relacao_memoria_atual_total=$(bc <<< "$memoria_consumida/$memoria_total *100" | awk '{print $1}')

if [ $relacao_memoria_atual_total -gt 5 ]
then
mail -s "Consumo de memoria acima do limite" adrianorrocha18@gmail.com<<del
O consumo de memória está acima do limite que foi especificado. Atualmente o consumo é de $(free -h | grep -i men | awk '{print $3}') 
del
fi

