V=20240821

PREFIX = /usr/local

update:
	gpg --recv-keys $(cat chililinux-trusted | cut -d: -f1) $(cat chililinux-revoked)
	gpg --export --armor $(cat chililinux-trusted | cut -d: -f1) $(cat chililinux-revoked) > chililinux.gpg

install:
	install -dm755 $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
	install -m0644 chililinux{.gpg,-trusted,-revoked} $(DESTDIR)$(PREFIX)/share/pacman/keyrings/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/share/pacman/keyrings/chililinux{.gpg,-trusted,-revoked}
	rmdir -p --ignore-fail-on-non-empty $(DESTDIR)$(PREFIX)/share/pacman/keyrings/
