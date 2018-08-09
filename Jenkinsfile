import groovy.json.JsonSlurper

node {
	
	$AZURE_CLIENT_ID = "0cf62efa-95fd-4c2d-b6d5-51778d5c0a84"
	$AZURE_CLIENT_SECRET = "87707728-ac21-44e1-aae5-1aeacc6f3cd3"
    $AZURE_TENANT_ID = "161d362d-5a7e-4e4a-a80a-44a5a7e5878a"
	$AZURE_SUBSCRIPTION_ID = "866cc0e3-a977-49d0-9c6b-1c76e374a498"
	
	stage ('CI')
		{
			echo 'Checkout latest'
			checkout scm
		}
  stage('Deploy') {
        withCredentials([azureServicePrincipal('AzureACR')]) {
           sh " docker build -t reactjs . "
				sh " docker tag reactjs reactjs.azurecr.io/reactjs:latest "
		sh " docker tag reactjs reactjs.azurecr.io/reactjs:${DOCKER_TAG} "
		sh " docker tag reactjs reactjs.azurecr.io/reactjs:${env.BUILD_NUMBER} "
				sh " docker login reactjs.azurecr.io -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET "
				sh " docker push reactjs.azurecr.io/reactjs:latest "
				sh " docker push reactjs.azurecr.io/reactjs:${env.BUILD_NUMBER} "
}
}
}
