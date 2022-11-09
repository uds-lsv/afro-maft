To run LAFT, provide the train and dev split for the langauge. The run the following script as provided in `train.sh`

```
python run_mlm.py \
	--model_name_or_path xlm-roberta-base \
	--train_file train.txt \
	--validation_file eval.txt \
	--per_device_train_batch_size 10 \
	--do_train \
	--do_eval \
	--num_train_epochs 3 \
	--save_steps 100000 \
	--overwrite_output_dir \
	--output_dir afro_xlmr_base
```

where 
`train.txt:` is the training monolingual data , and 

`eval.txt:` is the evaluation monolingual data 

Similarly, for MAFT concatenate all the monolingual texts for all the languages into a single file .e.g. `train.txt`, do same for the evaluation data, then run the script above.
