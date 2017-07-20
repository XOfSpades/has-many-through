#!/bin/sh

# docker-compose up -d --build has-many-throughs-postgres-cna-test-s

# docker-compose up -d --build has-many-throughs-postgres-dim-test-s

docker-compose up -d --build has-many-through-postgres-s

docker-compose build has-many-through-test-s

docker-compose run has-many-through-test-s

docker-compose down
