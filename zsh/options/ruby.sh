if which ruby > /dev/null
	then
	export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi

