

param(
    [string] $WorkingDirectory
)

& cd $WorkingDirectory

#Build the project, make sure to use Release as configuration to incude all the dependencies in the output and specify the correct runtime.
& dotnet build .\super-service\src\SuperService.csproj --configuration Release

#Build the Test project and run the tests, make sure to use Release as configuration to incude all the dependencies in the output and specify the correct runtime.
& dotnet test .\super-service\test\SuperService.UnitTests.csproj --configuration Release


#Publish the project before containerizing and verify the dll is properly created
& cd .\super-service\src
& dotnet publish --configuration Release

& docker build -t superservice-image -f Dockerfile .

#generate the helm chart for super-service
#helm package charts
#helm install super-service ./super-service-0.1.0.tgz

#helm list
#helm delete super-service
