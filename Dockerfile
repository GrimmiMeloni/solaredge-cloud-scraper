FROM telegraf:1.25.3

RUN apt-get update && apt-get install -y --no-install-recommends python3 python3-pip && \
	rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install requests pytz 

RUN mkdir /var/lib/telegraf
RUN chown 1024:100 /var/lib/telegraf

COPY solarEdgeCloudScraper.py /var/lib/telegraf/
RUN chmod +x /var/lib/telegraf/solarEdgeCloudScraper.py
