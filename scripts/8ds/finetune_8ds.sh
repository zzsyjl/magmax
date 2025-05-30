#!/bin/env/bash

set -e

eval "$(conda shell.bash hook)"
conda activate magmax

model=$1
seed=$2


# TRAIN
out_dir=outs/${model}/8datasets/ft/ind
mkdir -p ${out_dir}

python finetune_8datasets.py \
    --model ${model} \
    --seed ${seed} \
        |& tee ${out_dir}/seed:${seed}.out


# MERGE
out_dir=outs/${model}/8datasets/merging/ind
mkdir -p ${out_dir}

python merge_8datasets.py \
    --model ${model} \
    --seed ${seed} \
        |& tee ${out_dir}/seed:${seed}.out
