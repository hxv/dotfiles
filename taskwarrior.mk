all_targets += taskwarrior

taskwarrior_files = ~/.taskrc ~/.taskwarrior/holidays.rc ~/bin/task-rofi

taskwarrior: /usr/bin/task /usr/bin/timew $(taskwarrior_files) rofi ~/.task/hooks/on-modify.timewarrior
.PHONY: taskwarrior

/usr/bin/task:
	$(call install,taskwarrior)

/usr/bin/timew:
	$(call install,timewarrior)

~/.task/hooks/on-modify.timewarrior:
	cp /usr/share/doc/timewarrior/ext/on-modify.timewarrior $@
	chmod +x $@

$(taskwarrior_files):
	$(call homelink,$@)
