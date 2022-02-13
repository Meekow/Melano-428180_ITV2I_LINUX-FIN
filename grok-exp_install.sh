#!/bin/bash

git clone https://github.com/fstab/grok_exporter
cd grok_exporter
git submodule update --init --recursive
go install .