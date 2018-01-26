## [Project Gemtaku](www.gemtaku.com)

#### 잼타쿠는 방탈출, 보드게임, 스크린 야구 등의 매장 정보 및 테마 정보를 제공하고 커뮤니티 서비스를 제공하는 웹 서비스입니다.

##### 배포환경
- ruby 2.3.5
- rails 4.2.9
- ubuntu 16.04
- AWS Lightsail
- AWS Route 53
- AWS SES
- AWS S3

##### 개발환경
- ruby 2.3.6(dev), 2.3.5(deploy)
- rails 4.2.9
- ubuntu 16.04
- vagrant 1.9.5
- virtualbox 5.1.30

<hr>

##### 로그
<br>

###### 20180126

- club chat page 개선 페이지네이션을 통해 최신 채팅 먼저 보이게

- escapes, shops new 템플릿 작업

###### 20180125

- escapes show 템플릿 적용

###### 20180124

- 로그인, 회원정보 수정 뷰 템플릿 적용

- pagination
  > shop - 각 지역별 페이지에서도 각 지역의 카페만 가지고 오게
  > escape - 무한 스크롤 페이지네이션

###### 20180123

- 1차 방탈출 서비스 deploy 오류 해결 및 추가 테마 모델 dev 시작

- README 등록

- shop page에 multiple image 등록

- shop 주소필드 추가

- shop 평점 모델 추가(shop_review)
