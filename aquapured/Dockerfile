 # syntax=docker/dockerfile:1
 FROM balenalib/raspberry-pi-python as base
 COPY . .
 RUN pip install python-benedict
 CMD ["/bin/bash", "-c", "./aquapured/run.sh"]
