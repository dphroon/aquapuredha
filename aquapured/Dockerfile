 # syntax=docker/dockerfile:1
 FROM balenalib/raspberry-pi-python as base
 COPY . .
 RUN pip install python-benedict
 RUN chmod +x ./aquapured/run.sh
 RUN chmod +x ./aquapured/release/aquapured
 RUN chmod +x ./aquapured/release/aquapured_cache.sh
 RUN chmod +x ./aquapured/release/install.sh
 RUN chmod +x ./aquapured/extras/show_mem.sh
 RUN chmod +x ./aquapured/extras/meteohub-aq-plugin.sh
 RUN chmod +x ./aquapured/extras/aqualinkd.init-d
 CMD ["./aquapured/run.sh"]
