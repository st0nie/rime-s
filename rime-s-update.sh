#!/bin/bash

cd "$(dirname "$0")" || exit

for i in cn_dicts/*.dict.yaml en_dicts/*.dict.yaml; do
	wget "https://raw.githubusercontent.com/iDvel/rime-ice/main/$i" -O "$i"
done
