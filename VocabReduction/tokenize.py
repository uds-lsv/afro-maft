from transformers import XLMRobertaTokenizer
import torch
from collections import Counter
from tqdm.auto import tqdm, trange
import pickle

def get_args():
    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=str, help="Input text file containing the monolingual sentences. ")
    parser.add_argument("--output",  type=str, help="Path to store vocabulary and count. A pickle object . ")

    args = parser.parse_args()
    return args

def main():
    args = get_args()
    # read the text file 
    filepath = args.input
    outpath = args.output
    tokenizer = XLMRobertaTokenizer.from_pretrained('xlm-roberta-base')
    cnt_lan = Counter()

    with open(filepath) as fin:
        for text in fin:
            cnt_lan.update(tokenizer.encode(text))

    with open(outpath, 'wb') as fout:
        pickle.dump(cnt_lan, fout)

if __name__ == '__main__':
    main()
