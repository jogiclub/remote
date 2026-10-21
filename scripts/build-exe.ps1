<#
    파일 위치: scripts/build-exe.ps1
    역할: 고객 런처를 단일 실행 파일(RemoteHelp.exe)로 빌드한다. 서명은 하지 않는다.
          공식 배포 파일은 GitHub Actions(.github/workflows/build-sign.yml)가 빌드하고 SignPath 가 서명한다.

    사용 예:
      .\scripts\build-exe.ps1 -PortalBaseUrl https://portal.example.com/
#>
[CmdletBinding()]
param(
    [string]$Configuration = "Release",
    [string]$PortalBaseUrl = "https://portal.example.com/",
    [string]$OutDir = "$PSScriptRoot\..\artifacts"
)

$ErrorActionPreference = "Stop"

$project = Resolve-Path "$PSScriptRoot\..\src\RemoteHelp.App\RemoteHelp.App.csproj"

# 자체 포함 단일 파일이라 .NET 런타임 설치 없이 실행된다(약 70~90MB).
dotnet publish $project `
    -c $Configuration `
    -r win-x64 `
    --self-contained true `
    -p:PublishSingleFile=true `
    -p:IncludeNativeLibrariesForSelfExtract=true `
    -p:EnableCompressionInSingleFile=true `
    -p:DebugType=none `
    -p:PortalBaseUrl=$PortalBaseUrl `
    -o $OutDir

if ($LASTEXITCODE -ne 0) { throw "빌드에 실패했습니다." }

$exe = Join-Path $OutDir "RemoteHelp.exe"
if (-not (Test-Path $exe)) { throw "산출물을 찾을 수 없습니다: $exe" }

$hash = (Get-FileHash $exe -Algorithm SHA256).Hash.ToLower()
Write-Host "산출물 : $exe"
Write-Host "SHA-256: $hash"
