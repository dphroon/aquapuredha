 # syntax=docker/dockerfile:1
 FROM balenalib/raspberry-pi-python as base
 COPY . .
 RUN pip install python-benedict
 RUN chmod +x ./aquapured/run.sh
 RUN chmod +x ./aquapured/release/aquapured
 RUN chmod +x ./aquapured/release/aquapured_cache.sh
 CMD ["./aquapured/run.sh"]
