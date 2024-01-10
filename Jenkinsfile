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
				discordSend description: 'Testing Backend', 
				footer: 'Backend-Deploy-Test', 
				image: '', 
				link: "${BUILD_URL}", 
				result: '', 
				scmWebUrl: '', 
				thumbnail: '', 
				title: 'Backend', 
				webhookURL: ''
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
