#!/usr/bin/env bash
DATA_DIR="data"

MODEL_DIR="./chinese-roberta-wwm-ext"
OUTPUT_DIR="output/save_dict2/"
PREDICT_DIR="data/"
MODEL_TYPE="PMI"
MAX_LENGTH=128


echo "Start running"
if [ $# == 0 ]; then
    CUDA_VISIBLE_DEVICES=2 python run.py \
    --data_dir=${DATA_DIR} \
    --model_dir=${MODEL_DIR} \
    --output_dir=${OUTPUT_DIR} \
    --model=${MODEL_TYPE} \
    --do_train=True \
    --max_length=${MAX_LENGTH} \
    --batch_size=4 \
    --test_batch=200 \
    --epochs=10 \
    --seed=2021
elif [ $1 == "predict" ]; then
  python run.py \
      --data_dir=${DATA_DIR} \
      --model_dir=${MODEL_DIR} \
      --output_dir=${OUTPUT_DIR} \
      --model=${MODEL_TYPE} \
      --do_train=False \
      --max_length=${MAX_LENGTH} \
      --batch_size=16 \
      --epochs=10 \
      --seed=2021
fi
