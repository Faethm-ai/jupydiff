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
### Option 1 - Action
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
### Option 2 - Workflow
Get jupydiff working by simply adding the following main.yml file into your GitHub repo `/workflow` directory, and every time the workflow is triggered by push or pull request, the changes will be printed in the commit comment including pull request merges.
```yaml
on:            #chose trigger upon which the workflow will run(you can add custom ones if you want)
  push:

  pull_request:
  
name: jupydiff
jobs:
  build:

    runs-on: ubuntu-latest               #specify what you want your workflow to run on, currently its running on the latest Ubuntu virtual environment
    steps:                               #if you want to change it to a diffrent VM or local hosting check "https://docs.github.com/en/actions/hosting-your-own-runners" 
                                                                                        #and "https://github.com/actions/virtual-environments"
      - uses: actions/checkout@v2        #Clone your repo
        with:
          fetch-depth: 0

      - name: Set up Python               
        uses: actions/setup-python@v2
        with:
         python-version: 3.8
       
      - name: Set up Cache               #Caching of nbdime as it takes longer to install than to fetch from cache
        uses: actions/cache@v2
        with:
          path: ~/.cache/pip
          key: ${{ runner.os }}-pip-${{ hashFiles('**/requirements.txt') }}
          restore-keys: |
            ${{ runner.os }}-pip-
      - name: Install dependencies
        run: |
         pip install --upgrade nbdime
         
      - name: Retrieving Previous Commit
        run: git reset --soft HEAD~1

      - name: Run Jupyter Notebook Diff                      #Run nbdime diff on all jupyter notebook files
        run: 
         
         for f in $(find . -name '*.ipynb' -print); 
         do nbdime diff --no-color -s $f >> output.txt;
         done
       
      - name: Display Changes in Commit Comment
        uses: actions/github-script@v1
        with:
          github-token: ${{secrets.GITHUB_TOKEN}}
          script: |
            const fs = require('fs');
            function getSha() {
              if (context.eventName && context.eventName == "pull_request") {
                return context.payload.pull_request.head.sha;
              } else {
                return context.sha;
              }
            }
            async function run(data) {
              try {
                const sha = getSha();
                await github.repos.createCommitComment({
                  owner: context.repo.owner,
                  repo: context.repo.repo,
                  commit_sha: sha,
                  body: data.length == 0 ? "No Changes" : "```diff \n" + data + " ```"
                });
              } catch (error) {
                core.setFailed(error.message);
              }
            }  
            await fs.readFile('output.txt', function read(err, data) {
               if (err) {
                 throw err;
               }
               run(data.toString());
            });
```

## Dependencies
Another reason Jupyter Differ was created in its current form was to mitigate risk of man-in-the-middle attacks where maintainers of actions are able to manipulate dependencies and intercept data being passed through their actions. This led to only GitHub verified dependencies being used and Octokit. The list of dependencies is as follows:
* [action/checkout](https://github.com/actions/checkout)
* [action/setup-python](https://github.com/actions/setup-python)
* [action/cache](https://github.com/actions/cache)
* [action/github-script](https://github.com/actions/github-script)

## License
jupydiff is licensed under the terms of the [MIT](LICENSE)
