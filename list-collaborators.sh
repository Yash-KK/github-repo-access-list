#!/bin/bash


OWNER=$1
REPO=$2

# Checks if the correct number of arguments is provided
if [ $# -ne 2 ]
then
	echo "Args for $0: <owner> <repo>"
	exit 1
fi

function authenticate_github(){     
    # Curl command to fetch collaborators from GitHub API
    response=$(curl -sSL \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer $TOKEN" \
        "https://api.github.com/repos/$OWNER/$REPO/collaborators")

    # Check if curl command was successful
    if [ $? -ne 0 ]; then
        echo "Error: Failed to fetch collaborators from GitHub API"
        exit 1
    fi

    # Check if the response contains any errors
    if echo "$response" | jq -e 'has("message")' &> /dev/null; then
        error_message=$(echo "$response" | jq -r '.message')
        echo "Error: $error_message"
        exit 1
    fi

    # Extract logins of collaborators with pull access
    echo "$response" | jq -r '.[] | select(.permissions.pull == true) | .login'
}



collaborators=$(authenticate_github)
if [ -z "$collaborators" ]
then 
	echo "$OWNER/$REPO has no collaborators with pull access."
else
	echo "$OWNER/$REPO has the following collaborators with read access"
	echo "$collaborators"
fi
