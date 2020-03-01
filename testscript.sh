#!/bin/bash
cd Test_Cases
array=( login logout create delete advertise bid refund addCredit )
for i in "${array[@]}" #for each transaction to test
do
  echo "$i:"
  for j in $i/inputs/* #for each test case
  do
    #echo "running program with input: $j"
    filename=$(basename $j)
    #echo "first: $filename"
    #echo "output: > $i/test_outputs/$filename"
    ../src/a.out currentusers.txt availableitems.txt $i/test_transactions/$filename < $j > $i/test_outputs/$filename
    
    # test output files
    #echo "out: $filename"
    #if diff "$i/test_outputs/$filename" "$i/outputs/$filename";
    #then
    #  echo "TEST $filename OUTPUT: GOOD" >> ../test_results.txt
    #else
      # If the file is not good document the issue
    #  echo "TEST $filename OUTPUT: BAD" >> ../test_results.txt
    #  #echo "TEST $filename OUTPUT:" >> diff_log.txt
    #  diff $i/test_outputs/$filename $i/outputs/$filename >> ../diff_log.txt
      #echo $'\n' >> diff_log.txt
    #fi

    # test transaction files
    #echo "transaction: $filename"
    #if diff "$i/test_transactions/$filename" "$i/transactions/$filename";
    #then
    #  echo "TEST $filename TRANSACTION: GOOD" >> ../test_results.txt
    #else
      # If the file is not good document the issue
    #  echo "TEST $filename TRANSACTION: BAD" >> ../test_results.txt
      #echo "TEST $filename TRANSACTION:" >> ../diff_log.txt
    #  diff $i/test_transactions/$filename $i/transactions/$filename >> ../diff_log.txt
      #echo $'\n' >> diff_log.txt
    #fi
  done
done