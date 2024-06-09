#!/bin/bash


while getopts ":a:b:d:c:" opt; do
    case "${opt}" in
        a)
            LANDING_DIR=${OPTARG}
            ;;
        b)
            FILE_NAME=${OPTARG}
            ;;
        c)
            WAREHOUSE_DB=${OPTARG}
            ;;
        d)
            WAREHOUSE_TABLE=${OPTARG}
            ;;
        *) echo 'error' >&2
            exit 1
    esac
done

# echo "zone = ${LANDING_DIR}"
# echo "file = ${FILE_NAME}"
# echo "db = ${WAREHOUSE_DB}"
# echo "table = ${WAREHOUSE_TABLE}"

hdfs dfs -put ${LANDING_DIR}/${FILE_NAME} hdfs://172.23.14.75:9000/user/hive/warehouse/${WAREHOUSE_DB}.db/${WAREHOUSE_TABLE}
