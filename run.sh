#!/bin/bash

mkdir -p data

case "$1" in
    build_generator)
        docker build -t hw-generator -f Dockerfile.generator .
        ;;
    run_generator)
        docker run --rm -v "$(pwd)/data:/data" hw-generator
        ;;
    create_local_data)
        mkdir -p local_data
        python generate.py ./local_data
        ;;
    build_reporter)
        docker build -t hw-reporter -f Dockerfile.reporter .
        ;;
    run_reporter)
        docker run --rm -v "$(pwd)/data:/data" hw-reporter
        ;;
    *)
        echo "Использование: ./run.sh {build_generator|run_generator|create_local_data|build_reporter|run_reporter}"
        exit 1
        ;;
esac