FSB development tools
=====================
Tools designed to help FSB development, packaging,... This repository is mostly composed of documentation and external tools (git submodules).

To start using this, check the official wiki. Here is a short example :

	git clone git@github.com:FSB/FSB-dev-tools.git
	cd FSB-dev-tools
	git submodule init
	git submodule update
	cp user/build.properties.sample user/build.properties

Edit user/build.properties with your own values

	phing -f build.xml
	phing -f build.xml changelog-create

This package is released under GPLv3, check /doc/Licence.txt for more information.
