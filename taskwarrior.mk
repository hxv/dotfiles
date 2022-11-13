all_targets += taskwarrior

taskwarrior_files = ~/.taskrc ~/.taskwarrior/holidays.rc ~/bin/task-rofi ~/.task/hooks/on-modify.timewarrior

taskwarrior: /usr/bin/task /usr/bin/timew $(taskwarrior_files) rofi
.PHONY: taskwarrior

/usr/bin/task:
	cd /tmp && \
	  rm -rf taskwarrior && \
	  git clone https://github.com/GothenburgBitFactory/taskwarrior.git --branch=stable && \
	  cd taskwarrior && \
	  $(call install,libgnutls28-dev) && \
	  $(call install,uuid-dev) && \
	  cmake -DCMAKE_BUILD_TYPE=release . && \
	  make && \
	  sudo make install && \
	  rm -rf /tmp/taskwarrior

/usr/bin/timew:
	cd /tmp && \
	  rm -rf timewarrior && \
	  git clone --recurse-submodules https://github.com/GothenburgBitFactory/timewarrior.git --branch=stable && \
	  cd timewarrior && \
	  cmake -DCMAKE_BUILD_TYPE=release . && \
	  make && \
	  sudo make install && \
	  rm -rf /tmp/timewarrior

$(taskwarrior_files):
	$(call homelink,$@)
