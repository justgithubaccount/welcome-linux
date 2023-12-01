# https://www.jenkins.io/doc/book/managing/cli/

java -jar jenkins-cli.jar -s http://localhost:8080/ help

# unsave
java -jar jenkins-cli.jar -auth cli-user:Qq123456 -s http://localhost:8080/ who-am-i

# token
java -jar jenkins-cli.jar -auth cli-user:11c0acb7b3644c81c5da3f2dc5994fffce -s http://localhost:8080/ who-am-i

# via env varibles
export JENKINS_USER_ID=cli-user
export JENKINS_API_TOKEN=11c0acb7b3644c81c5da3f2dc5994fffce
env | grep JENKINS

java -jar jenkins-cli.jar -s http://localhost:8080/ who-am-i

# job from localhost
# get
java -jar jenkins-cli.jar -s http://localhost:8080/ get-job execute-shell-from-groovy \
> ~/github/welcome-linux/jenkins/execute-shell-from-groovy.xml

# create
java -jar jenkins-cli.jar -s http://localhost:8080/ create-job execute-shell-from-groovy-from-cli \
< ~/github/welcome-linux/jenkins/execute-shell-from-groovy.xml