podTemplate(yaml: readTrusted('pod.yaml')) {
    node(POD_LABEL) {
        stage('Checkout') {
            git branch: 'main', url: 'https://github.com/maxpain62/msdemo-emailservice.git'
        }
        stage('build') {
            container('py-build') {
                sh '''
                pip install -r requirements.txt
                cp -r /usr/local/lib/python3.14 ./python3.14
                pwd 
                ls -la
                '''
            }
        }
        stage('Build Docker Image') {
            container('buildkit') {
            sh """
                    buildctl --addr tcp://buildkitd.devops-tools.svc.cluster.local:1234\
                    --tlscacert /certs/ca.pem\
                    --tlscert /certs/cert.pem\
                    --tlskey /certs/key.pem\
                    build --frontend dockerfile.v0\
                    --opt filename=Dockerfile --local context=.\
                    --local dockerfile=.\
                    --output type=image,name=134448505602.dkr.ecr.ap-south-1.amazonaws.com/msdemo-emailservice,push=true
                """
            }
        }
    }
}