all_targets += taskwarrior

taskwarrior_files = ~/.taskrc ~/.taskwarrior/holidays.rc

taskwarrior: /usr/bin/task $(taskwarrior_files)
.PHONY: taskwarrior

/usr/bin/task:
	$(call install,taskwarrior)

$(taskwarrior_files):
	$(call homelink,$@)
