import yaml
from pprint import pprint
import json
import os

with open("prs.json","r") as f:
    prs = json.load(f)
print(prs)
latest_tag = os.environ["LATEST_TAG"]

if latest_tag == "":
	print("No release yet, skipping")

with open("release.yml","r") as f:
    config = yaml.safe_load(f)

categories = config["categories"]
print(categories)

outputs = []
for category in categories:
	outputs.append({
		"title":category["title"],
		"items":[el for el in prs if any(item in category["labels"] for item in el["labels"])]
	})
print()
pprint(outputs)
print(len(outputs))