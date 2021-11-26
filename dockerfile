FROM debian
#copy files
COPY . .
#set enviroment variables
ENV DB_ADDRESS=localhost
ENV DB_PORT=5432
ENV DB_DATABASE=gnucash
#install and set up cron and timezone
RUN cp /usr/share/zoneinfo/Europe/Oslo /etc/localtime
RUN apt-get update && apt-get install cron -y
RUN cp /crontab /etc/crontab
RUN touch /debug.log
#prepare files for start
RUN chmod +x *.sh 


ENTRYPOINT ["./entrypoint.sh"]
