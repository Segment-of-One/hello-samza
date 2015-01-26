#!/bin/bash

set -e
set -u

function pub {

  for var in "$@"
  do
    echo "$var"
    pubArtifact $var $var
  done;
}

function pubArtifact {
  curl --upload-file $1 -u $USER:$PASSWORD -v http://10.0.1.200:8081/content/repositories/so1-snapshot/$2
}


cd ~/.m2/repository/
pub org/apache/samza/samza-api/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-core_2.11/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-kafka_2.11/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-kv-rocksdb_2.11/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-kv_2.11/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-log4j/0.9.0-SNAPSHOT/*
pub org/apache/samza/samza-yarn_2.11/0.9.0-SNAPSHOT/*
cd -
