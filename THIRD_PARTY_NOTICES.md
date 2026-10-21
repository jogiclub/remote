# 제3자 소프트웨어 고지

RemoteHelp 런처는 원격제어 엔진을 직접 구현합니다. **GPL 구성요소를 포함하지 않으며,
외부 실행 파일을 동봉하거나 내려받지 않습니다.**

| 구성요소 | 라이선스 | 용도 |
|---|---|---|
| .NET 8 (Microsoft.NETCore.App, WindowsDesktop) | MIT | 런타임 |
| Vortice.Windows (Vortice.Direct3D11, Vortice.DXGI) | MIT | DXGI Desktop Duplication 화면 캡처 |

화면 캡처(GDI/DXGI), JPEG 인코딩(WPF `JpegBitmapEncoder`), 입력 주입(`SendInput`),
웹소켓 통신(`ClientWebSocket`)은 모두 윈도우와 .NET 기본 기능을 씁니다.
