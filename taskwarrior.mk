all_targets += taskwarrior

taskwarrior_files = ~/.taskrc ~/.taskwarrior/holidays.rc ~/bin/task-rofi ~/.task/hooks/on-modify.timewarrior

taskwarrior: /usr/bin/task /usr/bin/timew $(taskwarrior_files) rofi
.PHONY: taskwarrior

/usr/bin/task:
	$(call install,taskwarrior)

/usr/bin/timew:
	$(call install,timewarrior)

$(taskwarrior_files):
	$(call homelink,$@)
