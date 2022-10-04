#!/bin/bash

declare -a arr=("amh" "eng" "hau" "kin" "lin" "pcm" "sna" "som" "swa" "xho" "yor")
declare -A lang
lang=(["eng"]="english" ["hau"]="hausa" ["lin"]="lingala" ["swa"]="swahili" ["pcm"]="pidgin" ["yor"]="yoruba" ["sna"]="shona" ["som"]="somali"  ["amh"]="amharic" ["kin"]="kinyarwanda")
declare -a models=("afriberta" "xlmbase" "xlmlaft" "xlmlarge")

for modelname in "${models[@]}"
do
	if [ $modelname == 'xlmlaft' ]
	then
		ner_model_path='Davlan/afro-xlmr-base'
		tokenizer_path='Davlan/afro-xlmr-base'
	elif [ $modelname == 'xlmbase' ]
	then
		ner_model_path='xlm-roberta-base'
		tokenizer_path='xlm-roberta-base'
	elif [ $modelname == 'afriberta' ]
	then
		ner_model_path='castorini/afriberta_large'
		tokenizer_path='castorini/afriberta_large'
	elif [ $modelname == 'distxlmlarge' ]
	then
		ner_model_path='nreimers/mMiniLMv2-L12-H384-distilled-from-XLMR-Large'
		tokenizer_path='nreimers/mMiniLMv2-L12-H384-distilled-from-XLMR-Large'
	else
		echo 'None'
	fi

	MODEL_PATH=$ner_model_path	
	TOK_PATH=$tokenizer_path
	for SEED in 1 2 3 4 5
	do
		output_dir=classification_results/"${modelname}_text_results_${SEED}"
		mkdir -p $PWD/$output_dir
		
		for i in "${arr[@]}"
		do
			OUTPUT_DIR=$PWD/$output_dir/"$i"
			DATA_DIR=$PWD/text_data/"$i"
			python classification_scripts/classification_trainer.py --data_dir $DATA_DIR \
				--model_dir $MODEL_PATH \
				--tok_dir $TOK_PATH \
				--output_dir $OUTPUT_DIR \
				--language ${lang[$i]} \
				--seed $SEED \
				--max_seq_length 512
		done
	done
done 
