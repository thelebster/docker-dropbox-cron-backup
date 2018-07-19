#!/bin/sh

TMP_DIR="/tmp/"
DATE="$(date +"%m_%d_%Y-%H%M%S")"
BKP_FILE="$TMP_DIR/bkp_$DATE.txt"
DROPBOX_UPLOADER=/opt/dropbox_uploader/dropbox_uploader.sh

touch "$BKP_FILE"
gzip "$BKP_FILE"

$DROPBOX_UPLOADER -f /config/dropbox_uploader.conf upload "$BKP_FILE.gz" /

rm -fr "$BKP_FILE.gz"
