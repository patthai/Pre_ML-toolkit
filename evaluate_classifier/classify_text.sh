username=7e428de0-b815-4786-8987-a9a5cca4c2e3
password=inp5dfvc4fu3
classifier_id=$1
shift
text=$@

curl -G -u "${username}":"${password}" "https://gateway.watsonplatform.net/natural-language-classifier/api/v1/classifiers/${classifier_id}/classify" --data-urlencode "text=${text}"