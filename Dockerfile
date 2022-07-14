FROM nginx:1.23.0-alpine

RUN apk add python3 py3-pip
RUN pip install jinja2==3.1.2

COPY run.sh /run.sh
COPY config.j2 /config.j2
COPY config.py /config.py

RUN chmod 0744 /run.sh

RUN chmod -R a+rw /etc/nginx/conf.d/

WORKDIR /
ENTRYPOINT ["/run.sh"]
CMD ["nginx", "-g", "daemon off;"]
