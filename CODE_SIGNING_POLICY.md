# Code Signing Policy

이 문서는 RemoteHelp 런처(`RemoteHelp.exe`)의 코드 서명 정책입니다.

Free code signing provided by [SignPath.io](https://about.signpath.io/), certificate by [SignPath Foundation](https://signpath.org/).

## 서명 대상

- 이 저장소의 소스에서 **GitHub Actions(GitHub-hosted runner)가 빌드한** `RemoteHelp.exe` 만 서명합니다.
- 서명 요청은 `v*` 태그를 푸시했을 때만 발생하며, 설정은 [.github/workflows/build-sign.yml](.github/workflows/build-sign.yml) 과 [.signpath/artifact-configuration.xml](.signpath/artifact-configuration.xml) 에 공개되어 있습니다.
- 로컬 PC에서 빌드한 파일은 서명하지 않습니다.

## 역할

| 역할 | 담당 | 권한 |
|---|---|---|
| Committer / Reviewer | [jogiclub](https://github.com/jogiclub) | 소스 변경과 리뷰 |
| Approver | [jogiclub](https://github.com/jogiclub) | 릴리스 서명 요청을 수동 승인 |

모든 서명 요청은 승인자가 SignPath 에서 직접 승인해야 진행됩니다. 승인 계정에는 다단계 인증(MFA)을 적용합니다.

## 프라이버시 정책

RemoteHelp 는 **사용자가 접속 코드를 입력하고 연결을 허용했을 때만** 지원 상담원에게 화면을 전송합니다.
세션 중에는 화면에 지원 중임을 알리는 표시가 나타나며, 사용자는 언제든 연결을 끊을 수 있습니다.
이 프로그램은 사용자의 동의 없이 데이터를 외부로 전송하지 않으며, 설치형 백도어나 은닉 동작을 포함하지 않습니다.

## 악성 소프트웨어 방지

이 프로그램은 고객 지원 목적으로만 제작되었습니다. 악성코드, 원치 않는 프로그램(PUA), 은닉 실행 기능을 포함하지 않으며,
소스 전체가 이 저장소에 공개되어 있습니다.
