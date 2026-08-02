podTemplate(yaml: readTrusted('pod.yaml')) {
    node(POD_LABEL) {
        stage('Checkout') {
            git branch: 'main', url: 'https://github.com/maxpain62/msdemo-emailservice.git'
        }
        stage('build') {
            container('py-build') {
                sh '''
                pip install -r requirements.txt
                ls -la
                ls -la /usr/local/lib/python3.14/
                '''
            }
        }
    }
}