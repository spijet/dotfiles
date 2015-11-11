if [[ /usr/bin/env ruby -v > /dev/null 2>&1 ]]; then
	export PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	export GEM_HOME=$(ruby -e 'print Gem.user_dir')
fi

