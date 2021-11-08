# same image as toolkit
FROM alpine:3.13
LABEL "description"="Allows to create a PR of the latest commit in a given branch using github cli"

# data used to connect to the git 
ENV GITHUB_TOKEN=token

ENV GITHUB_REPO_NAME=user/repository
ENV GITHUB_BRANCH=pr_branch
# PR information
ENV PR_TITLE="PR title"
ENV PR_BODY="PR body"
# a set of labels separated by comma
ENV PR_LABELS="Status: Need review"

# install git
RUN apk --upgrade add --no-cache \
    git \
    curl 

# install github console
# based on https://github.com/cli/cli/issues/658
RUN mkdir /ghcli && cd /ghcli && \
    wget https://github.com/cli/cli/releases/download/v2.2.0/gh_2.2.0_linux_386.tar.gz -O ghcli.tar.gz && \
    tar --strip-components=1 -xf ghcli.tar.gz && \
    cp bin/gh /bin && \
    rm -r /ghcli

WORKDIR /bin

# And then all you have to do is launch a script to do 
#git clone -b ${GITHUB_BRANCH} https://${GITHUB_TOKEN}@github.com/${GITHUB_REPO_NAME}.git
#cd "${GITHUB_REPO_NAME#*/}" && ../bin/gh pr create --title ${PR_TITLE}  --body ${PR_BODY} --label ${PR_LABELS}
