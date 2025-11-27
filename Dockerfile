FROM alpine:latest

RUN apk add --no-cache bash
RUN apk add --no-cache postgresql-client
RUN apk add --no-cache jc

COPY ping-test.sh ping-test.sh
RUN chmod +x ping-test.sh

CMD ["./ping-test.sh"]
