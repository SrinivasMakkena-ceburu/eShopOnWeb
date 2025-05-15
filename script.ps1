$env:DOTNET_STARTUP_HOOKS = "C:\Users\Administrator.CEBURU\Desktop\ElasticApmAgent_1.31.0\ElasticApmAgentStartupHook.dll"
$env:ELASTIC_APM_SERVER_URLS = "http://54.203.133.174:8200"
$env:ELASTIC_APM_SECRET_TOKEN = "okok"
$env:ELASTIC_APM_SERVICE_NAME = "eShopOnWeb"
$env:ELASTIC_APM_ENVIRONMENT = "production"
$env:ELASTIC_APM_GLOBAL_LABELS = "custID=24"
cd "C:\Users\Administrator.CEBURU\Desktop\eShopOnWeb-main\eShopOnWeb-main\publish"
Start-Process .\Web.exe -WindowStyle Hidden