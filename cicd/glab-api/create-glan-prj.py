import os
import requests
from dotenv import load_dotenv

load_dotenv()

GITLAB_ACCESS_TOKEN = os.getenv("GITLAB_ACCESS_TOKEN")

def create_gitlab_project(name, description, visibility="private"):
    """
    Creates a project in GitLab with the specified parameters.

    :param name: Project name
    :param description: Project description
    :param visibility: Project visibility (private, internal, public)
    :return: API response as JSON or error message
    """
    url = "https://gitlab.com/api/v4/projects"
    headers = {
        "Content-Type": "application/json",
        "PRIVATE-TOKEN": GITLAB_ACCESS_TOKEN
    }
    data = {
        "name": name,
        "description": description,
        "visibility": visibility
    }

    response = requests.post(url, headers=headers, json=data)

    if response.status_code == 201:
        print("The project has been successfully created!")
        return response.json()
    else:
        print(f"Error creating project: {response.status_code}")
        return response.json()

if __name__ == "__main__":
    project_name = "snowsync-cfg-dev"
    project_description = "large-magellanic-cloud-project"
    project_visibility = "public"

    project_data = create_gitlab_project(project_name, project_description, project_visibility)
    print(project_data)