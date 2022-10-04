#!/bin/bash

MAX_LENGTH=164
BATCH_SIZE=16
NUM_EPOCHS=50
SAVE_STEPS=1000
declare -a arr=("amh" "eng" "hau" "ibo" "kin" "lug" "luo" "pcm" "swa" "wol" "xho" "yor")
declare -a models=("afriberta" "xlmbase" "xlmlaft" "xlmlarge")
#"rembert")

for modelname in "${models[@]}"
do
	if [ $modelname == 'afriberta' ]
	then
		ner_model_path='castorini/afriberta_large'
		tokenizer_path='castorini/afriberta_large'
	elif [ $modelname == 'xlmlaft' ]
	then
		ner_model_path='Davlan/afro-xlmr-base'
		tokenizer_path='Davlan/afro-xlmr-base'
	elif [ $modelname == 'xlmbase' ]
	then
		ner_model_path='xlm-roberta-base'
		tokenizer_path='xlm-roberta-base'
	elif [ $modelname == 'xlmlarge' ]
	then
		ner_model_path='xlm-roberta-large'
		tokenizer_path='xlm-roberta-large'
	else
		echo 'None'
	fi

	MODEL_PATH=$ner_model_path	
	TOK_PATH=$tokenizer_path
	for SEED in 1 2 3 4 5
	do
		output_dir=ner_results/"${modelname}_ner_results_${SEED}"
		mkdir -p $PWD/$output_dir
		
		for i in "${arr[@]}"
		do
			OUTPUT_DIR=$PWD/$output_dir/"$i"
			DATA_DIR=$PWD/ner_data/"$i"
			python ner_scripts/train_ner.py --data_dir $DATA_DIR \
				--model_type nil \
				--model_name_or_path $MODEL_PATH \
				--tokenizer_path $TOK_PATH \
				--output_dir $OUTPUT_DIR \
				--max_seq_length $MAX_LENGTH \
				--num_train_epochs $NUM_EPOCHS \
				--per_gpu_train_batch_size $BATCH_SIZE \
				--per_gpu_eval_batch_size $BATCH_SIZE \
				--save_steps $SAVE_STEPS \
				--seed $SEED \
				--do_train \
				--do_eval \
				--do_predict
		done
	done
done 
