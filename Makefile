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


