const core = require('@actions/core');
const github = require('@actions/github');
const context = github.context;
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
    const octokit = github.getOctokit();
    await octokit.repos.createCommitComment({
      owner: context.repo.owner,
      repo: context.repo.repo,
      commit_sha: sha,
      body: data.length == 0 ? "No Changes" : "```diff \n" + data + " ```"
    });
  } catch (error) {
    core.setFailed(error.message);
  }
}  
fs.readFile('output.txt', function read(err, data) {
   if (err) {
     throw err;
   }
   run(data.toString());
});
