#CURRENT=$(shell git branch | sed -n '/*/s///p' | sed -n 's/^ //p' | sed 's/.* //' | sed 's/）//')
CURRENT = `git branch | sed -n '/*/s///p' | sed -n 's/^ //p' | sed 's/.* //' | sed 's/）//' | sed "s/)//"`

.PHONY:git

pull:
	@echo git pull origin ${CURRENT}
	@git pull origin ${CURRENT}
	@git submodule update
	@git fetch -p
	@git fetch --tags
	@git fetch --all

push:
	@echo git push origin ${CURRENT}
	@git push origin ${CURRENT}

submodule/init:
	@git submodule update --init --recursive

submodule/update:
	@git submodule update

git/rebase:
	git stash
	git checkout develop
	git pull origin develop
	git submodule update
	git checkout $(CURRENT)
	git submodule update
	git rebase -i develop
	git stash pop | echo

git/merge:
	git stash
	git pull origin $(CURRENT)
	git checkout develop
	git pull origin develop
	git submodule update
	git merge --no-ff $(CURRENT)


.PHONY:clean clean force/clean
clean:
	@bash flutter clean
	@find ./ -name "outputs" | xargs rm -rf
	@find ./ -name "build" | xargs rm -rf

clear:clean

run:
	@flutter run

doctor:
	@flutter doctor