node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */
        // sh 'git clone git@git.tekdi.net:umesh_b/es-automation.git'

        /* Generates the ssh key for Jenkin*/
        // sh 'ssh-keygen -t rsa -f /var/lib/jenkins/.ssh/id_rsa -q -P ""'
        // sh 'cat /var/lib/jenkins/.ssh/id_rsa.pub'
        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */
        // app = docker.build("umeshbhosale/docker-ionic-build-automation")
        
        // sh 'sudo docker build -t umeshbhosale/docker-android-ionic .'
       
        
        sh 'cp -R $WORKSPACE/es-automation/es-automation-master $WORKSPACE'
        //sh 'rm -rf es-automation'
        //sh 'alias build="cd /var/lib/jenkins/workspace/Pipelined/es-automation/es-app"'
        //sh '$WORKSPACE = $WORKSPACE/es-automation/es-automation-master'
        //sh 'cd $WORKSPACE/es-automation/es-automation-master'
        sh 'ls'
        
        // sh 'cd /var/lib/jenkins/workspace/Pipelined/es-automation/es-app'
        // sh 'ls'
        // sh 'npm install'
        // sh 'ionic cordova platform add android@6.3.0'
        // sh 'ionic cordova platform ls'
        
        // sh 'ionic --version'
        // sh 'cordova --version'
        // sh 'node --version'
        // sh 'npm --version'
        // sh 'gradle --version'
        // sh 'ls'
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
