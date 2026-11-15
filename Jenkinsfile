pipeline {
    agent { label 'Docker' }
//    environment {
//        VERSION=sh(script: "chmod +x publisher/getVersionTag.sh && ./publisher/getVersionTag.sh", returnStdout:true)
//        BRANCH_NAME=sh(script: "chmod +x publisher/getBranch.sh && ./publisher/getBranch.sh", returnStdout:true).trim()
//    }
    stages {
        stage('docker build') {
            steps {
                sh 'docker --version'
                sh '''
                echo $(/usr/local/bin/getVersionTag.sh)
                '''
//                sh '''
//                docker build . -t ${IMAGE_NAME}:${VERSION}
//                '''
//                echo "Docker Image version: ${VERSION}"
            }
        }
//        stage ('Push Docker Image to Prod Registry') {
//            steps {
//                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
//                    sh '''
//                        NAMESPACE="reclusive/"
//
//                        if [ "${BRANCH_NAME}" = "master" ]; then
//                            echo "Building Docker Image for master branch"
//                            export IMAGE_NAME="cv"
//                        else
//                            echo "Building Docker Image for branch ${BRANCH_NAME}"
//                            export IMAGE_NAME="cv-${BRANCH_NAME}"
//                        fi
//
//                        echo "Docker Image version: ${VERSION}"
//                        echo "Docker registry: ${DOCKER_REGISTRY}"
//
//                        echo "${PASSWORD}" | docker login --username ${USERNAME} --password-stdin  https://${DOCKER_REGISTRY}
//                        docker tag ${IMAGE_NAME}:${VERSION} ${DOCKER_REGISTRY}${NAMESPACE}${IMAGE_NAME}:${VERSION}
//                        docker tag ${IMAGE_NAME}:${VERSION} ${DOCKER_REGISTRY}${NAMESPACE}${IMAGE_NAME}:latest
//
//                        docker push ${DOCKER_REGISTRY}${NAMESPACE}${IMAGE_NAME}:${VERSION}
//                        docker push ${DOCKER_REGISTRY}${NAMESPACE}${IMAGE_NAME}:latest
//                        docker logout https://${DOCKER_REGISTRY}
//                    '''
//                } //End credentials block
//            }
//        } //End push to registry stage
//        stage('deploy'){
////            Use nomad address to deploy the docker image to the nomad cluster
//            steps {
//                withCredentials([usernamePassword(credentialsId: 'docker', usernameVariable: 'DOCKER_REGISTRY_USERNAME', passwordVariable: 'DOCKER_REGISTRY_PASSWORD')]) {
//                    sh """
//                    if [ "${BRANCH_NAME}" = "master" ]; then
//                        echo "Deploying Docker Image for master branch"
//                    else
//                        echo "Deploying Docker Image for branch ${BRANCH_NAME}"
//                    fi
//
//                    export DOCKER_REGISTRY_ADDRESS="${DOCKER_REGISTRY}"
//                    export NOMAD_ADDR="https://${NOMAD}"
//                    export DOCKER_REGISTRY_NAMESPACE="reclusive/"
//
//                    if [ "${BRANCH_NAME}" = "master" ]; then
//                        levant plan -log-level debug -var 'branch=' -var-file "publisher/.env-template.yaml" publisher/cv.nomad
//                        levant deploy -force -log-level debug -var 'branch=' -var-file "publisher/.env-template.yaml" publisher/cv.nomad
//                    else
//                        levant plan -log-level debug -var "branch=${BRANCH_NAME}" -var-file "publisher/.env-template.yaml" publisher/cv.nomad
//                        levant deploy -force -log-level debug -var "branch=${BRANCH_NAME}" -var-file "publisher/.env-template.yaml" publisher/cv.nomad
//                    fi
//                    """
//                }
//            }
//        }
    }
}