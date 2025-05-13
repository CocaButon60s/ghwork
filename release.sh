#!/bin/bash

QUERY='[.[] | {number,title,labels:[.labels[].name],url,author: .author.name}]'
KEYS='number,title,labels,author,url'
CMD="gh pr list --base main --state merged"

latest_tag=$(gh release list --limit 1 --json tagName --jq '.[0].tagName')
echo ${latest_tag}

if [ -z "$latest_tag" ]; then
	prs=$(${CMD} --json "${KEYS}" --jq "${QUERY}")
else
	prs=$(${CMD} --search "merged:>${latest_tag}" --json "${KEYS}" --jq "${QUERY}")
fi
echo "$prs" >prs.json
export LATEST_TAG=${latest_tag}
