PACKAGES = idbi/goproto idbi/phpproto

update:
	@echo "Updating packages..."

	@echo "Triggering deployment..."
	# Iterate over all packages and call gh api
	# https://docs.github.com/en/rest/reference/actions#create-a-workflow-dispatch-event

	for package in $(PACKAGES); do \
		echo "Triggering deployment for $$package"; \
		gh pr --repo $$package view create-pull-request/patch --web; \
	done

	@echo "Done."

deploy:
	@echo "Merge PRs to deploy new versions of packages"

	for package in $(PACKAGES); do \
		echo "Merging PRs for $$package"; \
		gh pr --repo $$package merge create-pull-request/patch --auto --merge; \
	done


tag: deploy
	@echo "Tagging new versions of packages"

	for package in $(PACKAGES); do \
		echo "Tagging new version for $$package"; \
		gh pr --repo $$package merge release-please--branches--main --auto --merge; \
	done

	@echo "Done."

.PHONY: update deploy tag