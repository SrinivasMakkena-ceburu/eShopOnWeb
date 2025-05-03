# eShopOnWeb - Local Windows Service Deployment

This guide explains how to build, configure, and run the eShopOnWeb application as a Windows Service using the provided configuration.

---

## Prerequisites

- [.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0)
- Windows OS (with Administrator access)
- (Optional) [Visual Studio Code](https://code.visualstudio.com/)

---

## Configuration

The application uses the following `appsettings.json` (located at `src/Web/appsettings.json`):

```json
{
  "baseUrls": {
    "apiBase": "https://localhost:5099/api/",
    "webBase": "https://localhost:44315/"
  },
  "UseOnlyInMemoryDatabase": true,
  "ConnectionStrings": {
    "CatalogConnection": "Server=(localdb)\\mssqllocaldb;Integrated Security=true;Initial Catalog=Microsoft.eShopOnWeb.CatalogDb;",
    "IdentityConnection": "Server=(localdb)\\mssqllocaldb;Integrated Security=true;Initial Catalog=Microsoft.eShopOnWeb.Identity;"
  },
  "CatalogBaseUrl": "",
  "Logging": {
    "IncludeScopes": false,
    "LogLevel": {
      "Default": "Warning",
      "Microsoft": "Warning",
      "System": "Warning"
    },
    "AllowedHosts": "*"
  }
}
```

- **UseOnlyInMemoryDatabase**: Set to `true` to use an in-memory database (no SQL Server required).
- **baseUrls**: Configures API and Web base URLs for local development.

---

## Steps to Build and Run as a Windows Service

1. **Restore Dependencies**
   ```sh
   dotnet restore .\src\Web\Web.csproj
   ```

2. **Build the Application**
   ```sh
   dotnet build src/Web/Web.csproj
   ```

3. **Ensure `appsettings.json` is Published**

   Add this to your `src/Web/Web.csproj` if not present:
   ```xml
   <ItemGroup>
     <Content Update="appsettings.json">
       <CopyToOutputDirectory>Always</CopyToOutputDirectory>
       <CopyToPublishDirectory>Always</CopyToPublishDirectory>
     </Content>
   </ItemGroup>
   ```

4. **Publish as a Self-Contained Executable**
   ```sh
   dotnet publish src/Web/Web.csproj -c Release -r win-x64 --self-contained true -o ./publish
   ```

5. **Verify `appsettings.json` in the Publish Folder**

   Ensure `src/Web/publish/appsettings.json` exists.

6. **Open PowerShell as Administrator**

   - Click Start, type `powershell`
   - Right-click and choose **Run as administrator**

7. **Navigate to the Publish Folder**
   ```powershell
   cd E:\Demo\Dotnet\eShopOnWeb\src\Web\publish
   ```

8. **Create the Windows Service**
   ```powershell
   New-Service -Name "eShopOnWeb" -BinaryPathName "$pwd\Web.exe --windows-service" -DisplayName "eShopOnWeb" -Description "eShopOnWeb ASP.NET Core Application"
   ```

9. **Start the Service**
   ```powershell
   Start-Service -Name "eShopOnWeb"
   ```

10. **Verify the Service**

    - Open **Services** (`services.msc`) and look for "eShopOnWeb".
    - The status should be **Running**.
    - We should be able to access it on localhost:5000

11. **To Stop or Remove the Service**
    ```powershell
    Stop-Service -Name "eShopOnWeb"
    sc.exe delete eShopOnWeb
    ```

---

## Notes

- The application will use an in-memory database by default. To use SQL Server, set `"UseOnlyInMemoryDatabase": false` and update the connection strings.
- Always run service management commands as Administrator.
- Make sure to run the service from the folder where `Web.exe` and `appsettings.json` are present.

---

## Troubleshooting

- If you see errors about missing configuration, ensure `appsettings.json` is present in the publish folder.
- If you get "access denied" errors, close all running instances, delete `bin`/`obj` folders, and try again as Administrator.

---

**Enjoy running eShopOnWeb as a Windows Service!**