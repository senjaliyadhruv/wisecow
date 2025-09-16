#!/usr/bin/env bash
SRVPORT=4499

main() {
    echo "Wisdom served on port=$SRVPORT..."
    # Listen continuously and serve HTTP responses
    while true; do
        /usr/games/fortune | /usr/games/cowsay | awk 'BEGIN{print "HTTP/1.1 200 OK\r\nContent-Type: text/html\r\n\r\n<pre>"} {print $0} END{print "</pre>"}' | /bin/nc.openbsd -l -p $SRVPORT
    done
}

main
