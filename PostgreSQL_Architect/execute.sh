#!/bin/bash

DB_NAME="vectordb"
DB_USER="postgres"
DB_PASSWORD="bashaway2025"
DB_HOST="localhost"
DB_PORT="5432"

export PGPASSWORD=$DB_PASSWORD


psql -h $DB_HOST -p $DB_PORT -U $DB_USER -tc "SELECT 1 FROM pg_database WHERE datname = '$DB_NAME'" | grep -q 1 || \
    psql -h $DB_HOST -p $DB_PORT -U $DB_USER -c "CREATE DATABASE $DB_NAME"

psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c "CREATE EXTENSION IF NOT EXISTS vector;"

psql -h $DB_HOST -p $DB_PORT -U $DB_USER -d $DB_NAME -c \
    "CREATE TABLE IF NOT EXISTS embeddings (id SERIAL PRIMARY KEY, vec vector(3));"

echo "[+] Database and table setup complete."

gcc -o insert_vectors insert_vectors.c -lpq

./insert_vectors

echo "[+] Inserted sample vectors into the database."