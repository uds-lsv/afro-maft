# AfroXLMR: Adapting Pre-trained Language Models to African Languages via Multilingual Adaptive Fine-Tuning

This repository contains code and data for our COLING22 paper [***Adapting Pre-trained Language Models to African Languages via Multilingual Adaptive Fine-Tuning***](https://aclanthology.org/2022.coling-1.382/). 

In this paper, we propose multilingual adaptive fine-tuning (MAFT) as a method for simultaneously adapting multilingually pre-trained language models (PLMs) on 17 of Africa's most resourced languages and three other high-resource languages widely spoken on the continent. This is crucial since when utilized on downstream tasks, these PLMS typically show a considerable decline in performance on languages not seen during pretraining. Furthermore, as part of the contribution of this paper, we showed that we could specialize PLM to African languages by removing vocabulary tokens from the embedding layer of this PLM that does not correspond to African language scripts, thus effectively reducing the model size by 50%. We compared MAFT to a comparable strategy known as language adaptive fine-tuning (LAFT), and we tested our suggested approaches on three distinct NLP tasks for which African language datasets exist. Furthermore, in order to ensure that our suggested techniques are tested on typologically varied languages, we curated a unique dataset called ANTC- African News Topic Classification dataset, which contains five African languages. 


## Pretrained models

We release 2 kinds of pretrained models (they include both the base and large versions):
1. XLM-R + MAFT on 20 languages
2. XLM-R + LAFT on 20 languages

These models can be downloaded from [huggingface](https://huggingface.co/Davlan)

### Datasets
In this work, we evaluated our models on three downstream tasks

**NER**: To obtain the NER dataset, please download it from [this repository](https://github.com/masakhane-io/masakhane-ner)

**Text Classification**: To obtain the topic classification dataset, please download it from [this repository](https://github.com/uds-lsv/transfer-distant-transformer-african). Also in this repo we have included the newly created text classification dataset for 5 African languages.

**Sentiment Analysis**: To obtain the sentiment classification dataset, please download it from [this repository](https://github.com/hausanlp/NaijaSenti)

### Training/Experiments
To perform MAFT or LAFT, we have provided the training scripts

```
bash run.sh
```

For vocabulary reduction 



## Citation
If you find this reposity useful, please consider citing our paper.
```
@inproceedings{alabi-etal-2022-adapting,
    title = "Adapting Pre-trained Language Models to {A}frican Languages via Multilingual Adaptive Fine-Tuning",
    author = "Alabi, Jesujoba O.  and
      Adelani, David Ifeoluwa  and
      Mosbach, Marius  and
      Klakow, Dietrich",
    booktitle = "Proceedings of the 29th International Conference on Computational Linguistics",
    month = oct,
    year = "2022",
    address = "Gyeongju, Republic of Korea",
    publisher = "International Committee on Computational Linguistics",
    url = "https://aclanthology.org/2022.coling-1.382",
    pages = "4336--4349",
}
```
