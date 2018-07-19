FROM alpine:3.8

MAINTAINER Anton Lebedev <mailbox@lebster.me>

RUN apk add --no-cache bash curl

COPY /dropbox_uploader /opt/dropbox_uploader

COPY backup.sh /

RUN chmod +x /backup.sh

# Add crontab file in the cron directory
COPY crontab /crontab

# Apply cron job
RUN crontab /crontab

COPY entrypoint.sh /

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["crond", "-f", "-L -"]
