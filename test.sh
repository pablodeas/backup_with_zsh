#!/bin/bash

data=$(date +%y-%m-%d)
data_anterior=$(date -d "$data -3 days" +%y-%m-%d)

func test () {
    echo $data
    echo $data_anterior
}

test &> test.log