#!/usr/bin/env bash

for i in {1..1000}; do
  curl -d "title=title_"$i"&movie_id=movie_id_"$i \
      http://192.168.138.2:32765/wrk2-api/movie/register
done
