all: README.md

README.md: guessinggame.sh
	echo "##The Unix Workbench Assignment on coursera.org" > README.md
	echo "-**Description:** Enter a dangerous world of file number guessing, full of overweight demons, hairy pink monsters and banana peels. Only a few of them survived horrifically scarred. Are you brave enough to try?" >> README.md
	echo "-**Generated at:** $(shell date)" >> README.md
	echo "-**Number of lines contained in guessinggame.sh:** $(shell wc -l guessinggame.sh | egrep -o "[0-9]+")" >> README.md
