An example of running dropbox backup task as a cron job in a docker container. Build on top of [Dropbox Uploader](https://github.com/andreafabrizi/Dropbox-Uploader).

Copy `example.env` to `.env`.

```
cp example.env .env
```

Generated access token and put to `.env` file.

```
chmod +x docker-start-daemon.sh
./docker-start-daemon.sh
```
