OWNER := hagatasdelus

depsdev:
	brew install Songmu/tap/maltmill

update/%:
	maltmill -w Formula/$*.rb

create/%:
	maltmill new -w -o Formula/$*.rb $(OWNER)/$*

update-all:
	grep -l darwin Formula/*.rb | xargs -n 1 maltmill -w

.PHONY: depsdev update-all
