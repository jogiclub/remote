# RemoteHelp 런처

고객 PC에서 상담원에게 화면을 보여주고 원격 지원을 받을 수 있게 하는 Windows 프로그램(`RemoteHelp.exe`)의 소스입니다.
고객이 접속 코드를 입력하고 **직접 허용했을 때만** 화면이 전송됩니다.

- 언어/런타임: C# / .NET 8 (WPF), Windows 10 1809 이상 x64
- 원격제어 엔진을 직접 구현했습니다(화면 캡처 GDI·DXGI, JPEG 타일 인코딩, 입력 주입, 웹소켓 중계). VNC를 쓰지 않습니다.
- 라이선스: [MIT](LICENSE) · 제3자 고지: [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md)

## 빌드

[.NET 8 SDK](https://dotnet.microsoft.com/download/dotnet/8.0) 가 필요합니다.

```powershell
.\scripts\build-exe.ps1 -PortalBaseUrl https://portal.example.com/
```

결과는 `artifacts\RemoteHelp.exe` 에 만들어집니다. 포털 주소는 빌드할 때 고정되며,
개발 중에는 `REMOTEHELP_PORTAL` 환경변수로 바꿀 수 있습니다.

## 실행

고객이 포털에서 내려받은 `RemoteHelp_<조직코드>.exe` 를 실행하면 파일 이름에서 조직 코드를 읽습니다.
`remotehelp://connect?org=<조직코드>` 주소로도 실행할 수 있습니다.

## 서명과 배포

공식 릴리스 파일은 GitHub Actions 가 이 소스에서 빌드하고 SignPath Foundation 이 서명합니다.
자세한 내용은 [CODE_SIGNING_POLICY.md](CODE_SIGNING_POLICY.md) 를 보세요.

Free code signing provided by [SignPath.io](https://about.signpath.io/), certificate by [SignPath Foundation](https://signpath.org/).

릴리스 파일의 SHA-256 은 각 [Release](../../releases) 에 함께 올라갑니다.

## 구조

```
src/RemoteHelp.App/     런처 (WPF)
  Services/Engine/      화면 캡처, 인코딩, 입력 주입, 중계 서버 클라이언트
scripts/build-exe.ps1   단일 exe 빌드
.github/workflows/      빌드와 SignPath 서명
.signpath/              SignPath 서명 대상 정의
```
