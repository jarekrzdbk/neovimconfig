if did_filetype()
    finish
endif
if getline(2) =~ '^#!.*\perl\>'
	setfiletype perl
endif
