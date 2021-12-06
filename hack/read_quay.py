# This script stores the last stable ocp releases and checks if next stable release is available.
import requests
import json
import os
import sys

# append latest/stable builds to respective release files
def save_releases(filename, mode, build="Empty", builds=[]):
    if len(builds) == 0 and build!="Empty":
        with open(filename, mode) as f:
            f.write(build + "\n")
    elif len(builds) == 10 :
        with open(filename, mode) as f:
            for stable_build in builds:
                f.write(stable_build.strip() + "\n")

# reading latest release
def read_last_releases(release):
    with open(release, "r") as f:
        build = f.readlines()
    if len(build) != 0:
        if build[0].strip() == "" or  build[0].strip() is None:
            print("File is empty: "+ release)
            return ["Empty"]
    elif len(build) == 0:
        return ["Empty"]
    return build

# Generating next expected builds for particular release
def get_next_build(release):
    if os.path.isfile(release + "-latest-build.txt") == False:
        current_build   = release + ".0-ppc64le"
        next_build      = current_build
    else:
        current_build   = read_last_releases(release + "-latest-build.txt")[0].strip()
        if current_build != "Empty":
            build_split     = current_build.split("-")
            build_split     = build_split[0].split(".")
            build_split[-1] = str(int(build_split[-1]) + 1)
            build           = ".".join(build_split)
            next_build      = build + "-ppc64le"
        else:
            next_build = "Empty"

    return current_build, next_build

# Getting newer releases from Quay.io using API
def check_quay_image(tag):
    url = 'https://quay.io/api/v1/repository/openshift-release-dev/ocp-release/tag/?onlyActiveTags=true&specificTag='+  tag 
    response = requests.get(url)

    if response.status_code != 200:
        print("No new build found with tag : " + tag)
        print("Error while fetching the details from quay.io")
    else:
        if len(response.json()['tags']) == 1:
            return response.json()['tags'][0]

# Keeping only last 10 older builds in the stable-build.txt files
def clean(release):
    builds = read_last_releases(release + "-stable-build.txt")
    if len(builds) > 10:
        print("Cleaning the older build history for the release: " + release)
        builds.pop(0)
        save_releases(release + "-stable-build.txt", "w", builds=builds)

      
# saving build informations
def get_newer_releases(release):
    current_build, next_build = get_next_build(release)

    if current_build != "Empty" and next_build != "Empty":
        build_info = check_quay_image(next_build) 
        
        if build_info != None and build_info != "":
            print(build_info['name'] + ", last modified: " + build_info['last_modified'])  
            # print(build_info['manifest_digest'])
            if current_build != build_info['name']:
                save_releases(release + "-stable-build.txt", "a" , current_build)
                clean(release)
            save_releases(release + "-latest-build.txt", "w", build_info['name'])
        else:
            print("No new build found for the release : " + release)

def initialize_latest_releases(releases):

    release_46  = releases[1]
    release_47  = releases[2]
    release_48  = releases[3]
    release_49  = releases[4]
    release_410 = releases[5]
    
    if release_46 != "default":
        save_releases("4.6-latest-build.txt", "w", release_46 + "-ppc64le")
    if release_47 != "default":
        save_releases("4.7-latest-build.txt", "w", release_47 + "-ppc64le")
    if release_48 != "default":
        save_releases("4.8-latest-build.txt", "w", release_48 + "-ppc64le")
    if release_49 != "default":
        save_releases("4.9-latest-build.txt", "w", release_49 + "-ppc64le")
    if release_410 != "default":
        save_releases("4.10-latest-build.txt", "w", release_410 + "-ppc64le")
    
if __name__ == "__main__":
    if len(sys.argv) == 2  or sys.argv[1] != "default":
        release_no = sys.argv[1].split(".")[-1]
        if len(release_no) == 1:
            get_newer_releases(str("{:.1f}".format(float(sys.argv[1]))))
        else:
            get_newer_releases(str("{:.2f}".format(float(sys.argv[1]))))
    else:
        initialize_latest_releases(sys.argv)
        

        



        