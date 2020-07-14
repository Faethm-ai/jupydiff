# jupydiff

Working repo for jupydiff project. This is in a private account for initial development since we will need to estimate GitHub Action consumption (a paid service) that will drain the Faethm account's quota.

## Goals

We want to make it easy for reviewers to see what has changed between versions of Jupyter notebooks (.ipynb files) in a pull request, before the request is approved and the code is merged

Right now, this requires the review to manually check the old and new files by downloading them and running tools like nbdime locally or in their AWS SageMaker notebooks instance

## Stage 1 (internal usage)

### Configure GitHub action

- checkoutv2 action, set depth=0 to pull entire repo history not just the latest, since we want to be able to dig up the previous files
- work out how identify any .ipynb files changed in the most recent commit (maybe `git diff --name-only HEAD HEAD~1`)
- for each file above, work out how to get the previous version
- work out how to install `nbdime` (or another suitable notebook diffing tool)
- for each pair of files (i.e. the latest and the previous), run the diffing tool and capture the outputs
- format the outputs of each diff as a markdown tableau for easy comparison. github comments support markdown - how rich can we make the contents? what if image outputs change etc? what makes sense to include?
- github-script action, work out how to add a comment to the Pull Request that will trigger this action to run, with the markdown formatted tables prepared above
- make sure the action is trigger on a pull request

### Testing

- create a .ipynb file and push changes to a new branch
- create a pull request and see if the action works
- demo, feedback from data science team and iterate for usability - is this actually achieving our goals?

## Stage 2 (packaging)

### Python package

- can we package up all the logic used in our github action (excluding the git checkout and github commenting) for standalone use in a git repo?
- we should be able to run the package from the command line (e.g. `jupydiff notebook.ipynb`)
- publish the package on pypi and update the github action to use it
- create a nice and simple readme.md to help people set it up in their GitHub repo

### Self-hosted runners

- GitHub actions by default run on GitHub-managed infrastructure. this might not be suitable for some users. GitHub has support for self-hosting the runners (the compute instance that executes the process above). how do we do this?
- include all the required files in the repo

### GitLab/Bitbucket/etc

- GitHub is not the only version control system used by data scientists. how easily can we support the workflow in GitLab and BitBucket?
