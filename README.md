# Jupyter Differ
Differ for Jupyter Notebooks that enables a quick comparison of changes with the previous HEAD commit usinng GitHub authorised Actions and dependencies to deter man-in-the-middle attacks.
## Table of contents
* [General info](#general-info)
* [Setup](#setup)
* [Dependencies](#dependencies)

## General info
This tool was created out of the need to save time during the process of code auditing and to ease the review process for people working with Jupyter Notebooks. Previously the options to diff Jupyter Notebooks was to clone your repo locally, download/install nbdime diff, run it through a Shell UI or compare changes of the raw `.ipynb` in code editors like Visual Studio Code and worst case senario do it by manually(eww).

## Setup
Jupyter Differ works by simply adding the main.yml file into your GitHub repo, and every time the workflow is tiggered, the changes will be printed in the commit comment. 

## Dependencies
Another reason Jupyter Differ was created in its current form was to mitigate risk of man-in-the-middle attacks where maintainers of actions are able to manipulate dependencies and steal data being passed through their actions. This led to only GitHub verified actions being used. The list of dependencies is as follows:
* [action/checkout](https://github.com/actions/checkout)
* [action/setup-python](https://github.com/actions/setup-python)
* [action/cache](https://github.com/actions/cache)
* [action/github-script](https://github.com/actions/github-script) 
