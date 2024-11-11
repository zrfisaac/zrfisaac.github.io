#!/usr/bin/python
# [ zrfisaac ]

# [ about ]
# - author : Isaac Caires
# . - email : zrfisaac@gmail.com
# . - site : zrfisaac.github.io
# version : zrfisaac.python.github.list : 1.0.0

# [ python ]

import os
import requests

# Replace these with your personal access tokens
GITHUB_TOKEN = os.getenv('GITHUB_TOKEN')
GITLAB_TOKEN = os.getenv('GITLAB_TOKEN')

def list_github_repos():
    url = 'https://api.github.com/user/repos'
    headers = {'Authorization': f'token {GITHUB_TOKEN}'}
    response = requests.get(url, headers=headers)
    
    if response.status_code == 200:
        repos = response.json()
        print("GitHub Repositories:")
        for repo in repos:
            print(f"- {repo['name']}: {repo['html_url']}")
    else:
        print(f"Failed to retrieve GitHub repositories: {response.status_code}")

def list_gitlab_repos():
    url = 'https://gitlab.com/api/v4/projects'
    headers = {'Authorization': f'Bearer {GITLAB_TOKEN}'}
    params = {'membership': 'true'}  # Only retrieve projects where you're a member
    response = requests.get(url, headers=headers, params=params)
    
    if response.status_code == 200:
        repos = response.json()
        print("\nGitLab Repositories:")
        for repo in repos:
            print(f"- {repo['name']}: {repo['web_url']}")
    else:
        print(f"Failed to retrieve GitLab repositories: {response.status_code}")

if __name__ == '__main__':
    list_github_repos()
    list_gitlab_repos()
