# GitHub Collaborator Reader
This script retrieves a list of collaborators with read access from a specified GitHub repository. It utilizes the GitHub API to fetch the collaborators' information.

<h2>Prerequisites</h2>
<ul>
  <li>Bash shell environment </li>
  <li>cURL command-line tool </li>
  <li>jq - a lightweight and flexible command-line JSON processor </li>
</ul>

<h2>Authentication</h2>
The script requires authentication to access the GitHub API. Make sure to export your personal access token as the <strong>$TOKEN </strong> environment variable before running the script.

```bash

TOKEN="your_personal_access_token"
export TOKEN

```
<h2> Output </h2>
The script outputs the list of collaborators with pull access (read access) to the specified repository. 

<h3>Usage</h3>

```bash
./list-collaborators.sh <owner> <repo>
```

<h3>Example</h3>

```bash
./list-collaborators.sh Yash-KK Django-BlogSite
```
![list-collaborators-output](https://github.com/Yash-KK/github-repo-access-list/assets/95636204/6f119565-85ef-46a1-b493-78262d3581e9)
