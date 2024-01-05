def credential = 'github'
def server = 'team1@103.127.132.84'
def directory = '/home/team1/wayshub-backend'
def branch = 'main'
def service = 'backend'

pipeline {
	agent any
	stages {

                stage('send notif'){
                        steps {
				echo "Test To Discord"
				discordSend description: 'Testing Frontend', 
				footer: 'Backend-Deploy', 
				image: '', 
				link: "${BUILD_URL}", 
				result: '', 
				scmWebUrl: '', 
				thumbnail: '', 
				title: 'Frontend', 
				webhookURL: 'https://discord.com/api/webhooks/1192368582273794128/9IM58FV5MLUCJWQtr1dhnmFWC2hJyiwRlJwM7n-vvqxGRtfzlj6N5vZIQCf7TLScOIJj'
                                }
                }
		
		stage('pull request'){
			steps {
				sshagent([credential]) {
					sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
					docker compose down ${service}
					cd ${directory}
					git pull origin ${branch}
					exit
					EOF"""
				}
		}
}

                stage('building'){
                        steps {
                                sshagent( [credential]) {
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        docker compose down ${service}
                                        exit
                                        EOF"""
                                }
                }
}

                stage('deploy'){
                        steps {
                                sshagent([credential]) {
                                        sh """ssh -o StrictHostKeyChecking=no ${server} << EOF
                                        docker compose up -d ${service}
                                        exit
                                        EOF"""
                                }
                }
}

}
}
