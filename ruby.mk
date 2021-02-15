all_targets += ruby

ruby_gems = bundler jekyll

ruby_gems_targets = $(addprefix ~/gems/bin/,$(ruby_gems))

ruby: /usr/bin/ruby $(ruby_gems_targets)
.PHONY: ruby

/usr/bin/ruby:
	$(call install,ruby-full)
	$(call install,ruby-dev)

$(ruby_gems_targets):
	mkdir -p ~/gems
	GEM_HOME="$(HOME)/gems" gem install $(notdir $@)

