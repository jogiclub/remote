/**
 * 파일 위치: src/RemoteHelp.App/Services/AppInfo.cs
 * 역할: 앱 버전과 포털 주소 등 기본 설정값 제공
 */
using System.Reflection;

namespace RemoteHelp.Services;

public static class AppInfo
{
    public static string Version =>
        Assembly.GetExecutingAssembly().GetName().Version?.ToString(3) ?? "1.0.0";

    /// <summary>
    /// 포털 주소. 빌드할 때 -p:PortalBaseUrl=https://포털주소/ 로 고정한다.
    /// 개발 중에는 REMOTEHELP_PORTAL 환경변수로 바꿀 수 있다.
    /// </summary>
    public static string PortalBaseUrl =>
        Environment.GetEnvironmentVariable("REMOTEHELP_PORTAL") ?? BuiltInPortalBaseUrl;

    private static string BuiltInPortalBaseUrl =>
        Assembly.GetExecutingAssembly()
            .GetCustomAttributes<AssemblyMetadataAttribute>()
            .FirstOrDefault(a => a.Key == "PortalBaseUrl")?.Value
        ?? "https://portal.example.com/";

    public const string ProductName = "RemoteHelp";
}
