classifier_id=$1
csv_file=$2
scripts=/Users/pat.pataranutaporn/Documents/Suicidal_Artists/EXP/experiment_4/STEP7_evaluate_classifier/ 
while read line; do bash $scripts/classify_text.sh $classifier_id $(echo $line |  perl -lpe 's/\s*,\s*"\w+?"$//g') ; done < $csv_file > $csv_file.$classifier_id.classes
