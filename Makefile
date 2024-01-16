PACKAGES = idbi/goproto idbi/phpproto

update:
	@echo "Updating packages..."

	@echo "Triggering deployment..."
	# Iterate over all packages and call gh api
	# https://docs.github.com/en/rest/reference/actions#create-a-workflow-dispatch-event

	for package in $(PACKAGES); do \
		echo "Triggering deployment for $$package"; \
		gh api -X POST /repos/$$package/actions/workflows/20-generate.yml/dispatches -F ref=main; \
	done

	@echo "Done."

deploy:
	@echo "Merge PRs to deploy new versions of packages"

	for package in $(PACKAGES); do \
		echo "Merging PRs for $$package"; \
		gh pr --repo $$package merge create-pull-request/patch --auto --merge; \
	done


tag:
	@echo "Tagging new versions of packages"

	for package in $(PACKAGES); do \
		echo "Tagging new version for $$package"; \
		gh pr --repo $$package merge release-please--branches--main --auto --merge; \
	done

	@echo "Done."

.PHONY: update deploy tag

.WAIT_60:
	@echo "Waiting for 60 seconds..."
	sleep 60
.WAIT_10:
	@echo "Waiting for 10 seconds..."
	sleep 10

all: update .WAIT_60 deploy .WAIT_10 tag