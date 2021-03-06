CC = gcc -O2 -Wall

bindir = /bin

DHVERSION = $(shell git describe --tags)

dh: dh.c
	$(CC) dh.c -o dh -DDHVERSION=\"$(DHVERSION)\"

install: dh
	install -m 1777 -d /var/log/dh
	install -m 755 -d $(bindir)
	install -m 755 -p -s dh $(bindir)

clean::
	rm -f dh
