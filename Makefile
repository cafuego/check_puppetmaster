all:
	@echo "Run 'make install' to install the script to /usr/local/bin"

install:
	install -m 755 check_puppetmaster /usr/local/bin/check_puppetmaster
	install -m 755 default /etc/default/check_puppetmaster

uninstall:
	/bin/rm -f /usr/local/bin/check_puppetmaster
	/bin rm -f /etc/default/check_puppetmaster
