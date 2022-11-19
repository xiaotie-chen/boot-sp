#!/bin/bash
# run the farmer example in user mode

echo "Running in serial, compute xhat within user_boot"
echo
time python -m bootsp.user_boot multi_knapsack --max-count 121 --candidate-sample-size 1 --sample-size 75 --subsample-size 10 --nB 10 --alpha 0.05 --seed-offset 100  --solver-name cplex --boot-method Bagging_with_replacement --deterministic-data-json=test.json
exit
echo
echo "========================"
echo
echo "Running in serial, use an xhat that is computed elsewhere"
echo
time python -m bootsp.user_boot farmer --max-count 121 --candidate-sample-size 1 --sample-size 75 --subsample-size 10 --nB 10 --alpha 0.05 --seed-offset 100  --solver-name cplex --boot-method Bagging_with_replacement --xhat-fname farmer_xhat.npy

# You can give a "known" optimal to user_boot, but it won't use it for anything.
#--optimal-fname farmer_optimal.npy
