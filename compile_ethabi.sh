#!/bin/bash

cd $HOME/ethabi
cargo build
cp /home/ethabiuser/ethabi/target/debug/ethabi /home/ethabiuser/output/
