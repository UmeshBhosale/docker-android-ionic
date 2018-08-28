node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        sh 'git clone https://git.tekdi.net/umesh_b/es-automation.git'
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        // app = docker.build("umeshbhosale/docker-ionic-build-automation")
        
        // sh 'sudo docker build -t umeshbhosale/docker-android-ionic .'
        // sh 'ionic --version'
        // sh 'cordova --version'
        // sh 'node --version'
        // sh 'npm --version'
        // sh 'gradle --version'
        sh 'ls'
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        /*app.inside {
            sh 'echo "Tests passed"'
        }*/
    }

    /*stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. 
        docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }*/
}
