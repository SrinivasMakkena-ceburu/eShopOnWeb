$environment = [string[]]@(
    "COR_ENABLE_PROFILING = 1"
    "COR_PROFILER = {FA65FE15-F085-4681-9B20-95E04F6C03CC}"
    "COR_PROFILER_PATH = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64\elastic_apm_profiler.dll"
    "ELASTIC_APM_PROFILER_HOME = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64"
    "ELASTIC_APM_PROFILER_INTEGRATIONS = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64\integrations.yml"
    "ELASTIC_APM_SERVER_URL = http://54.203.133.174:8200"
    "ELASTIC_APM_SECRET_TOKEN = okok"

    "CORECLR_ENABLE_PROFILING = 1"
    "CORECLR_PROFILER = {FA65FE15-F085-4681-9B20-95E04F6C03CC}"
    "CORECLR_PROFILER_PATH = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64\elastic_apm_profiler.dll"
    "ELASTIC_APM_PROFILER_HOME = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64"
    "ELASTIC_APM_PROFILER_INTEGRATIONS = C:\Users\Administrator.CEBURU\Desktop\elastic_apm_profiler_1.31.0-win-x64\integrations.yml"
    "ELASTIC_APM_SERVER_URL = http://54.203.133.174:8200"
    "ELASTIC_APM_SECRET_TOKEN = okok"
)
Set-ItemProperty HKLM:SYSTEM\CurrentControlSet\Services\eShopOnWeb -Name Environment -Value $environment