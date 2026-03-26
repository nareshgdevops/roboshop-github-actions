FROM            docker.io/redhat/ubi9
RUN             curl -L -o /etc/yum.repos.d/hashi.repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
RUN             curl -L -o /etc/yum.repos.d/docker-ce.repo https://download.docker.com/linux/rhel/docker-ce.repo
RUN             dnf install -y https://packages.microsoft.com/config/rhel/9.0/packages-microsoft-prod.rpm
RUN             dnf install libicu make terraform azure-cli docker-ce-cli -y
RUN             curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /bin/kubectl && chmod +x /bin/kubectl
#NODEJS
RUN             dnf module disable nodejs:22 -y && dnf module enable nodejs:22 -y && dnf install nodejs npm -y
#MAVEN
RUN             dnf install maven -y
#HELM
RUN             curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
#ARGOCD
RUN             curl -L https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 -o argocd
RUN             chmod +x argocd
RUN             mv argocd /usr/local/bin/
RUN             useradd github
USER            github
WORKDIR         /home/github
RUN             curl -o actions-runner-linux-x64-2.331.0.tar.gz -L https://github.com/actions/runner/releases/download/v2.331.0/actions-runner-linux-x64-2.331.0.tar.gz && tar xzf ./actions-runner-linux-x64-2.331.0.tar.gz
#SONARQUBE CLI
RUN             curl -o sonar-scanner-cli-7.3.0.5189-linux-x64.zip -L https://binaries.sonarsource.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-7.3.0.5189-linux-x64.zip && unzip sonar-scanner-cli-7.3.0.5189-linux-x64.zip && rm -rf sonar-scanner-cli-7.3.0.5189-linux-x64.zip
COPY            run.sh /
ENTRYPOINT      ["bash", "/run.sh"]
