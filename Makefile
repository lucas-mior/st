# st - simple terminal
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

all: st

SRC = st.c x.c boxdraw.c
OBJ = $(SRC:.c=.o)

SRCS = arg.h boxdraw.c boxdraw_data.h config.h st.c st.h win.h x.c

st: $(SRCS) Makefile
	$(CC) $(STCFLAGS) -flto $(SRC) -o st $(STLDFLAGS)

clean:
	rm -f st st-$(VERSION).tar.gz

dist: clean
	mkdir -p st-$(VERSION)
	cp -R FAQ LEGACY TODO LICENSE Makefile README config.mk\
		st.info st.1 arg.h st.h win.h $(SRC)\
		st-$(VERSION)
	tar -cf - st-$(VERSION) | gzip > st-$(VERSION).tar.gz
	rm -rf st-$(VERSION)

install: st
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f st $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/st
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < st.1 > $(DESTDIR)$(MANPREFIX)/man1/st.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/st.1
	tic -sx st.info
	@echo Please see the README file regarding the terminfo entry of st.
	cp -f st_copyout.sh $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/st_copyout.sh
	cp -f st_urlhandler.sh $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/st_urlhandler.sh
	mkdir -p $(DESTDIR)$(ICONPREFIX)
	[ -f $(ICONNAME) ] && cp -f $(ICONNAME) $(DESTDIR)$(ICONPREFIX) || :

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/st
	rm -f $(DESTDIR)$(MANPREFIX)/man1/st.1
	rm -f $(DESTDIR)$(PREFIX)/bin/st_copyout.sh
	rm -f $(DESTDIR)$(PREFIX)/bin/st_urlhandler.sh
	rm -f $(DESTDIR)$(ICONPREFIX)/$(ICONNAME)

.PHONY: all clean dist install uninstall
