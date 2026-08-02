podTemplate(yaml: readTrusted('pod.yaml')) {
    node(POD_LABEL) {
        stage('Checkout') {
            git branch: 'main', url: ''
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