FROM alpine:3.8

MAINTAINER Anton Lebedev <mailbox@lebster.me>

RUN apk add --no-cache bash curl

COPY /dropbox_uploader /opt/dropbox_uploader

# Create configuration file with an Access Token
RUN mkdir -p /config && \
  touch /config/dropbox_uploader.conf && \
  echo OAUTH_ACCESS_TOKEN > /config/dropbox_uploader.conf

COPY backup.sh /backup.sh

RUN chmod +x backup.sh

# Add crontab file in the cron directory
COPY crontab /crontab

# Apply cron job
RUN crontab /crontab

CMD ["crond", "-f", "-L -"]
