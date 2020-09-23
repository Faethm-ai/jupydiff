<div align="center">
  <img src="logo.png">
</div>

-----------------

# Faethm jupydiff Docker Action for GitHub Actions
Automated differ for Jupyter Notebooks that enables a quick comparison of changes with the previous HEAD commit using GitHub authorised Actions and dependencies.

## Table of contents
* [General info](#general-info)
* [Usage](#Usage)
* [Dependencies](#dependencies)
* [License](#license)

## General info
jupydiff was created out of the need to save time during code auditing and to ease the review process for people working with Jupyter Notebooks. Previously the options to diff Jupyter Notebooks was to clone your repo locally, download/install nbdime diff, run it through a Shell UI or compare changes of the raw `.ipynb` in code editors like Visual Studio Code and worst case scenario do it by manually.

## Usage
We give you the option of deploying jupydiff in two different configurations, one being a docker action, two being a local yaml workflow.
### Action
Add `action/checkout` to your workflow `.yml` file and set the `fetch-depth: 2`. Insert `Faethm-ai/jupydiff` into your workflow as shown below and you’re all set. Take note - this action can take up to 2 minutes to run, due to dependency installations.

```yaml
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repo
        uses: actions/checkout@v2
        with:
          fetch-depth: 2
        
      - name: Run jupydiff
        uses: Faethm-ai/jupydiff@master
```
### Workflow
Get jupydiff working by simply adding the main.yml file into your GitHub repo, and every time the workflow is triggered, the changes will be printed in the commit comment including pull request merges.

## Dependencies
Another reason Jupyter Differ was created in its current form was to mitigate risk of man-in-the-middle attacks where maintainers of actions are able to manipulate dependencies and intercept data being passed through their actions. This led to only GitHub verified dependencies being used and Octokit. The list of dependencies is as follows:
* [action/checkout](https://github.com/actions/checkout)
* [action/setup-python](https://github.com/actions/setup-python)
* [action/cache](https://github.com/actions/cache)
* [action/github-script](https://github.com/actions/github-script)

## License
jupydiff is licensed under the terms of the [MIT](LICENSE)
