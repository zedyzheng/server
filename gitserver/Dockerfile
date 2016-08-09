FROM  redis:3.2.3
MAINTAINER joey

WORKDIR /app/
COPY manage.sh /app/
COPY redis.conf /app/

#ONBUILD ADD manage.sh /app/

ENV PORT 6379
ENTRYPOINT ["/app/manage.sh"]
CMD ["6379"]