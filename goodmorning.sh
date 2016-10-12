printf "\n#################################### \n"
printf "##     Good Morning, $(whoami) :)    ## \n"
printf "#################################### \n\n"

printf "Let's check your Internet connection first... \n\n"

ping -q -c 5 www.google.com ; exit_status="$?"

if [[ exit_status -eq 0 ]]; then
	printf "\nOk, your Internet connection is working. Here we go! :)\n\n"

	printf "\nBrew update and upgrade\n"
	brew update && brew upgrade && brew prune && brew cleanup

	printf "Conda and Python update\n"
	conda update conda
	conda update anaconda
	conda update python
	conda update --all --yes
	conda clean --all --yes

	printf "\nR packages update\n"
	R -q -e "update.packages(repos='http://cran.us.r-project.org', ask = FALSE)"

	printf "\n#################################### \n"
	printf "##    Done! See you tomorrow :)   ## \n"
	printf "#################################### \n\n"
else
	printf "Your Internet connections is not working :/ \n"
fi

# softwareupdate -ir