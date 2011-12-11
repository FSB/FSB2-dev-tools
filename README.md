FSB dev tools
=============
Tools to help on FSB devellopements, packaging, ...
Mainly documentation and external tools as git submodules

To start using this see FSB official wiki or quickly :

	git clone git@github.com:FSB/FSB-dev-tools.git
	cd FSB-dev-tools
	git submodule init
	git submodule upate
	cp user/build.properties.sample user/build.properties

Edit user/build.properties with your own value

	phing -f build.xml
	phing -f build.xml changelog-create

This package is release under GPLv3, more informations on doc/Licence.txt

# EOF
