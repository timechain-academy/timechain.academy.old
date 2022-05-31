# make
## Usage

	 make	[COMMAND]	[EXTRA_ARGUMENTS]	

	 make	help			print verbose help
	 make	report			print environment arguments

	 make	all			install and run playground and cluster

	 make	setup			basic setup for ubuntu/macOS
	 make	init			initialize basic dependencies
	 make	initialize		install libs and dependencies on ubuntu/macOS

	 make	build			docker images
	 make	build	para=true	parallelized build
	 make	build	para=true nocache=true verbose=true

	 make	install	
	 make	install	services=bitcoind
	 make	install	services=bitcoind,lnd
	 make	install	services=bitcoind,cln
	 make	install	services=bitcoind,lnd,rtl
	 make	install	services=bitcoind,lnd,thunderhub
	 make	install	services=bitcoind,lnd,lndg,rtl,thunderhub,docs,tor,dashboard,notebook

	 make	run

	[DEV ENVIRONMENT]:	

	 make signin profile=gh-user     ~/GH_TOKEN.txt required from github.com
	 make package-all


	    [EXAMPLES]:

	    make run nocache=true verbose=true
	    make init && play help

