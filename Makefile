# Sublime Text Preferences deployment
VERSION = 0.1
PREFIX = ${HOME}/.config/sublime-text-3/Packages

# funcs
options:
	@echo Deployment options:
	@echo "HOME = ${HOME}"
	@echo "PREFIX = ${PREFIX}"

clean:
	@echo Cleaning…
	@rm -rf sublime-text-preferences*.tar.gz

dist: clean
	@echo Creating distribution tarball…
	@mkdir -p sublime-text-preferences-${VERSION}
	@cp -R Makefile User sublime-text-preferences-${VERSION}
	@tar -cf sublime-text-preferences-${VERSION}.tar sublime-text-preferences-${VERSION}
	@gzip sublime-text-preferences-${VERSION}.tar
	@rm -rf sublime-text-preferences-${VERSION}
	@echo Done. Generated file “sublime-text-preferences-${VERSION}.tar.gz”.

install:
	@echo Installing preferences…
	@rm -r ${PREFIX}/User
	@echo Done. If you change settings here, you will need to “make install”.
	@cp `pwd`/User ${PREFIX}/User

link:
	@echo Linking repository to Sublime Text preferences…
	@rm -r ${PREFIX}/User
	@ln -s `pwd`/User ${PREFIX}/User
	@echo Done. To change settings use this repository.

.PHONY: options clean dist install link all
