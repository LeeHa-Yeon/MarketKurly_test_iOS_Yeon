# MarketKurly_test_iOS_Yeon ( 하연 -> 연 )

# 개발일지

주제 : 마켓컬리 A조 

팀원 : 클 ( 연 ) - 서버 ( 스티브, 샐리 )

내용 : 라이징캠프 2주간 클라이언트 - 서버 협업 프로젝트 진행 

깃 링크 : 

[https://github.com/mock-rc3/MarketKurly_test_iOS_Yeon](https://github.com/mock-rc3/MarketKurly_test_iOS_Yeon)

시연 영상 :

[https://www.youtube.com/watch?v=OWuFydau26I](https://github.com/mock-rc3/MarketKurly_test_iOS_Yeon)


<details>
<summary>개발</summary>
<div markdown="1">

## 개발

- UI
    - 여러 디바이스에서도 깨짐이 없도록 AutoLayout를 고려하여 제약조건을 설정하였다.
    - 색상 - 이미지를 캡쳐하여 자주 사용하는 색상은 “웹 사이트(이미지에서 색상 추출하여 hex로 만들기)“ 를 통해 Extension UIColor에 저장해두고 사용하였고, 그 외 한 두번 사용할 색상은 스포이드로 추출하여 사용
    - 이미지 누끼를 따거나 비슷한 형태의 이미지를 다운을 받아서 사용하였다.
- 코드
    - 코드 관리는 MARK를 사용하였다. 프로퍼티, Component 부분, LifeCycle, Functions, objc Functions 등 구분하여 관리하니 코드의 길이가 길어질 때도 찾기가 수월하였다.
    - 자주 사용할 것 같은 코드 빼놓기
        - Extension를 하여 여기에 따로 함수를 만들었다. 이후 필요한 곳에서 함수를 호출하여 사용하였더니 더 코드의 길이도 줄어들고 사용하기 편하고 가독성이 좋아보였다 ( 템플릿을 보고 배움 )
            
            <img width="273" alt="스크린샷 2022-03-13 오후 10 45 17" src="https://user-images.githubusercontent.com/55241258/158062436-08edfd59-f213-48ea-9daf-7e29ddfa2023.png">

            
    - 폴더 구조를 구분하여 관리
    - 최대한 코드로 직접 구현하였고, 시간상 오래걸릴 것 같은 부분은 라이브러리를 이용 ( 단, 내 화면에 맞게 커스텀하여 사용 )
    - 서버와 연동하는 부분은 따로 함수로 분리

</div>
</details>

<details>
<summary>개발범위</summary>
<div markdown="2">

    
## 개발 범위

- 회원가입
- 로그인, 로그아웃
- 아이디찾기 ( 이메일, 전화번호 )
- 비밀번호찾기 (이메일, 전화번호 )
- 마이컬리 ( 비회원, 회원 )
    - 회원 정보 화면 표시
    - 전체등급 보기, 다음달 예상등급 보기, 알림설정, 찜한 상품, 친구초대, 배너, 선물내역, 공지사항, 고객센터, 이용안내
    - 가입혜택보기, 컬리 퍼플 박스, 컬리 소개, 컬리패스, 배송안내
    - 상품 후기( 작성가능후기, 작성완료후기 ) - 구매한게 없어서 화면이 어떻게 나오는지 몰라서 기본화면만 햇음
- 배송지
    - 배송지 선택 ( 상단 마커 클릭 )
    - 배송지 관리
    - 배송지 추가 ( 주소검색, 상세주소 작성 )
    - 배송지 수정, 삭제
    - 주문서에서 배송정보 입력,수정 부분
- 주문
    - 주문서 작성
    - 주문 내역 리스트 ( 주문 내역, 자주 사는 상품 )
    - 주문 내역
    - 주문 내역 상세
    - 주문 상세 부분
    - 자주 사는 상품
    - 주문 후 결과 화면
- 장바구니
- 홈
    - 컬리추천 화면 ( 상품 리스트 )
        - 타이머 기능 구현
    - 신상품
    - 베스트
    - 알뜰쇼핑
    - 특가/혜택
- 카테고리
- 검색
    - 검색 첫 화면
    - 검색어를 입력만 했을 때 나타나는 검색 리스트
    - 검색어를 입력 후 나타나는 결과 리스트
- 상품 상세페이지
    - 상품설명
    - 상품정보
    - 상품 선택 (구매하기 누르면 나타남 )
    - 상품 후기
    - 후기 보기
    - 상품 문의하기
    - 문의 작성하기
- 쿠폰
    - 쿠폰 다운로드
    - 쿠폰 등록
    - 쿠폰 내역
- 이벤트
    - 이벤트 구현 화면
- 적립금  내역

---

</div>
</details>


<details>
<summary>API</summary>
<div markdown="3">

## API

### 엮은 API

### 1) 회원 - 샐리

---

회원가입 POST

전체유저조회 GET

특정유저조회 GET

로그인 POST

유저정보변경 PATCH

회원 탈퇴 PUT

이메일로 비밀번호 찾기 GET

전화번호로 비밀번호 찾기 GET

새로운 비밀번호 만들기  PATCH

배송지 추가하기 POST

배송지조회 GET

특정배송지조회 GET

배송지수정 PATCH

배송자삭제 DELETE

내 찜 목록 조회 GET 

찜하기 POST

찜삭제  DELETE

레벨조회GET 

개별레벨 GET

이벤트조회 GET

이벤트참가 GET

사용자쿠폰 조회 GET

사용자쿠폰Id등록 GET

쿠폰조회 GET

적립금조회 GET

장바구니 생성 POST

장바구니 조회 GET

장바구니 삭제 DELETE

결제정보 GET

주문 POST

주문내역조회 GET

주문 상세내역 조회 GET

---

### 2 ) 상품 - 스티브

상품쪽 API가 계속 수정되어 최종본이 너무 늦게나왔습니다. 또, 다른 연관된 API와 데이터 정보가 맞지 않거나 M이 표시되어있는 곳에 null이 들어가는 등 이슈들이 많이 발생하여 상품쪽과 연관된 앱 개발에 지연이 있었습니다. 또, 소통의 오류로 한개의 API로 조회할 수 있는 “주제별 상품들 조회”를 여러개 생성하여 그 부분을 같이 해결하는데 시간을 더 소요하여 작업의 진행이 더디어졌습니다. 

---

전체 아이템 조회 GET

아이템 조회(+검색) GET

카테고리 리스트 GET 

공지 사항 GET

카테고리에 존재하는 상품들 GET 

상위 아이템 카테고리 조회 GET

카테고리별 아이템  목록 조회 GET

상품 디테일  GET

신상아이템목록 GET

베스트 아이템 목록 GET

알뜰상품 상품리스트 GET

낮은 가격 순  상품리스트 GET

높은 가격 순  상품리스트 GET

전체 상품설명 조회  GET

상품설명 조회 GET

주제별 API GET

주제별 API 전체 GET

---

### 그 외 엮지 않고 POSTMAN에서 사용한 API

이메일로 아이디찾기API  - 만드시기전에 이미 다른API 엮어서 이미 구현함

전화번호로 아이디찾기 API  - 만드시기전에 이미 다른API 엮어서 이미 구현함

알림설정 조회 - 프런트에서 UserDefault로 구현

결제정보 생성 API - 만들때만 포맨에서 사용하고 프런트에서 사용할 필요가 없음

레벨생성API - 만들때만 포맨에서 사용하고 프런트에서 사용할 필요가 없음

이벤트생성 API - 만들때만 포맨에서 사용하고 프런트에서 사용할 필요가 없음

쿠폰 등록 API -  만들때만 포맨에서 사용하고 프런트에서 사용할 필요가 없음

전체 쿠폰 조회 API - 확인용으로 포맨에서 사용


</div>
</details>


<details>
<summary>개발일지</summary>
<div markdown="5">    
    
    
## 개발일지

### 1일차 개발일지

- ~~기획서 작성 및 제출~~
    
    ‣ - 100% ( 피드백 받음)
    
    - ~~지켜야할 사항~~
        
        ```swift
        1차 피드백 전, 최소한 진행해야할 사항들 
        
        - 로그인 / 회원가입 
        - 홈화면 첫화면 
        - 내정보 로그인 여부를 판단할 수 있는 UI
        
         이슈가 생긴다면, 바로 말씀해주세요. 
        
         추가로, iOS 라이징테스트 프로젝트 구성 고려사항입니다. 
        
        ## UI
        
        1. UI는 Storyboard base 이구요. 부분적으로 Code 혹은 Xib 사용은 가능합니다. 
        2. 오토레이아웃 진행 시, 최소 2 기기 확인하셔서, 레이아웃 에러 한 번씩 체크해주세요. 
        (추천드리는 기기는 "iPhone 8" , "iPhone 13 Pro Max" 실행을 통해 비교해보세요) 
        3. 앱 아이콘은 추가하지 않을게요. 
        4. 다크모드는 고려하지 않고 LightMode 고정입니다. 
        
        ## 프로젝트 구성
        만약 아키텍쳐 패턴적용하신다면, 해당 부분 말씀해주세요.
        
        ex) MVC / MVP / MVVM ... etc 
         기본적으로는 MVC로 구성하는 것으로 간주하겠습니다. 
        
        ## 라이브러리 
         Rx 혹은 Combine은 사용하지 않겠습니다. 
        
        ## 네트워크
         Network Layer는 5주차 수업 그리고 탬플릿에 있는 것처럼 Request 클래스를 통해서 따로 분리해주세요. 
        
         위 사항들이 어렵게 받아들이실 수도 있는데, 지금까지 해오신 방향으로 진행하신 것들을 글로 작성한 것 뿐입니다. 
         혹시 질문 있으시면 질문주세요~!
        ```
        
- ~~서버와 회의진행~~

---

- ~~README - 개발일지 링크 연결~~
- ~~기본 환경 구축~~
    - ~~gitignore file 추가~~
    - ~~네트워크 통신, 이미지 캐싱을 위해 Alarmofire, Kingfisher pod install~~
    - ~~폴더구성, 기초 작업 완료~~
    - ~~기본 UI 작업 하단 완료~~
- ~~UI~~
    - ~~로그인 구현 완료 - 100 %~~
    - ~~마이컬리 비회원 구현 완료 - 100 %~~
- ~~서버~~
    
    ~~서버가 준 로그인 회원가입 API Postman에서 테스트 - 완료~~ 
    

### 2일차 개발일지

- ~~홈 화면 컬리추천 - 90% 구현 완료 → 100% (MD 빼기로 함)~~
    - ~~홈화면 페이징뷰 구현 완료~~
    - ~~이벤트 배너 자동 페이징 구현 완료~~
    - ~~상품 - 여러 셀로 나누어 구현 완료~~
    - MD 추천 부분은 구현 안하기로 결정 
- ~~마이컬리~~
    - ~~회원가입 UI 구현 100%~~
    - ~~아이디찾기 UI 구현 100%~~
    - ~~비밀번호 찾기 UI 구현 100%~~
    - ~~회원일때 UI 구현 100%~~
- ~~서버와 회의진행~~

### 3일차 개발일지

- ~~1차 피드백~~
- ~~홈 화면~~
    - ~~컬리추천 UI 구현 100%~~
    - ~~신상품 UI 구현 100%~~
    - ~~베스트 UI 구현 100%~~
    - ~~알뜰쇼핑 UI 구현 100%~~
    - ~~특가/혜택 UI 구현 100%~~
- ~~마이컬리~~
    
    ~~로그인, 회원가입 API 부분 연동 후 테스트 완료 100%~~
    
- ~~리팩토링~~
    
    ~~리팩토링~~
    
    ~~기타 추가로 피드백 후 전체 리팩토링 진행~~
    
- ~~서버와 회의진행~~

### 4일차 개발일지

- ~~네비게이션 버그 수정~~
- ~~리팩토링 작업~~
- ~~마이컬리부분 해결~~
- ~~서버와 회의진행~~
- ~~회원쪽 API 연동 후 테스트 - ok~~
    - 에러
        - 400 : url 잘못이거나 인코딩문제
        [https://medium.com/@jakoriaty/alamofire-400-error-문제-9ca84c498e38](https://medium.com/@jakoriaty/alamofire-400-error-%EB%AC%B8%EC%A0%9C-9ca84c498e38)
        - 415 : "***Unsupported Media Type***" 오류
        [http://daplus.net/java-json에서-http-415-지원되지-않는-미디어-유형-오류/](http://daplus.net/java-json%EC%97%90%EC%84%9C-http-415-%EC%A7%80%EC%9B%90%EB%90%98%EC%A7%80-%EC%95%8A%EB%8A%94-%EB%AF%B8%EB%94%94%EC%96%B4-%EC%9C%A0%ED%98%95-%EC%98%A4%EB%A5%98/)
    
    ```swift
    let para: SignUpRequest = SignUpRequest(username: "test333e", email: "test333e@naver.com", password: "111", phone_number: "asdfa",birth: nil, gender: nil)
            signUpManager.requestSignUp(parameter:para){ response in
                print("djakfs->\(response)")
            }
    ```
    

### 5일차 개발일지

- ~~서버와의 회의~~
- 검색화면
    - ~~검색창 직접 구현 ( 커스텀했음 ) 100%~~
    - ~~검색 초기화면 UI 구현 100%~~
    - ~~검색어를 입력했을 때 나타나는 검색리스트 화면 UI 구현 100%~~
    - ~~검색 결과를 나타내는 화면 UI 구현 100%~~
        - ~~검색결과가 있을 경우 UI 구현 100%~~
        - ~~검색결과가 없을 경우 UI 구현 100%~~

---

- API 부분
    - ~~서버에서 나온 명세서를 토대로 Postman에서 테스트 진행함~~

### 6일차 개발일지

- ~~서버와의 회의~~
- 카테고리 화면
    - ~~카테고리 리스트 - 선물하기 부분 완료~~
    - ~~카테고리 리스트- 카테고리별 상위, 하위 나누어 테이블 확장하도록 구현~~
    - ~~카테고리 리스트 - 컬리추천 부분 완료~~
    - ~~카테고리를 선택하여 해당 카테고리의 디테일 화면으로 이동 완료~~
- 서버
    - ~~로그인 기능 구현 완료~~
    - ~~회원가입 기능 구현 완료~~
    - ~~아이디 찾기 기능 구현 완료~~
    - ~~비밀번호 찾기 기능 구현 완료~~
    - ~~전체 유저 조회 API 연동~~
    - ~~특정 유저 조회 API 연동~~
    - ~~유저 정보 수정 API 연동~~

### 7일차 개발일지

- ~~서버와의 회의~~
- ~~API 수정 후 로그인 최종 완료~~
- ~~API 수정 후 회원가입 최종 완료~~
- ~~API 수정 후 아이디 찾기 최종 완료~~

---

- ~~로그인할때 jwt로 userDefault로 저장하면서 쓰기 ( 다른 방법: keychain )~~

---

### 8일차 개발일지

- ~~서버와의 회의~~
- ~~공유하는 화면 구현 완료~~
- ~~상품 선택 화면 - 수량 stepper `GMStepper` 를 이용하여 구현~~
- ~~아이템 상세페이지 상품설명 구현 완료~~
- ~~상품 선택 화면 구현 완료~~
- ~~비밀번호찾기 구현 완료~~

### 9일차 개발일지

- ~~주제별 API, 전체 상품 조회 API, 특정 상품 조회 API .. 등 API 구조 짜서 서버에게 전달~~
- ~~서버와의 회의~~
    - ~~서버에서 완성한 API 계속 봐주기(스티브)~~
    - ~~서버에서 수정한 API 테스트해주기 ( 샐리 )~~
    - ~~회의 ) 샐리님과 배송지 관련 부분 수정 사항 말씀드리기~~
- ~~네비게이션 상단에 바버튼 생성 후 간격 조정~~

### 10일차 개발일지

- ~~2차 피드백~~
- ~~서버와의 회의~~
- ~~텍스트필드가 있는 곳은 화면 터치했을 때 내려가도록 구현하기~~
- ~~아이템 상세페이지로 이동할때 옆으로 이동하는 거 해결~~
- ~~배송지~~
    - ~~배송 정보 입력하는 부분 화면이 복잡해서 시간이 오래걸림  - 구현 완료~~
        - scrollView에 높이를 동적으로 조절할 수 있는 stackView를 사용했음
        - 공동현관 출입방법은 생략하고 **나중에 수정하자**
- ~~주문~~
    - ~~주문결과~~
    - ~~주문내역~~
        - ~~주문내역 리스트~~
        - ~~자주사는상품 리스트~~
        - ~~자주사는 상품으로 화면 이동~~
    - ~~주문화면~~
- ~~발생 이슈 해결~~
    - ~~발생이슈 해결 : 화면 전환시 네비게이션 화면 전환 효과와 전환 후 색상 변경 등~~
    - ~~발생이슈 : 주문내역에서 xlpagertabstrip 적용이 안됨 ( 이유를 아직도 모르겠음 )~~
        - ~~딱, 마이컬리페이지 → 주문내역으로 갈때만 안되고~~
        - ~~다른곳에서 이동해도 그러는지 봤는데 그때는 적용이 잘됨~~
        - ~~따라서, 이 부분에서 삽질을 오래하고 안된다는 것을 안 후 버튼을 통한 컨테이너뷰로 수정했음~~

### 11일차 개발일지

---

- ~~서버와의 회의 - 질문 내용 전달, 현 상황 듣기~~
    - 샐리님 : 쿠폰 부분, 이벤트 부분
        
        ---
        
        - 이미지만 띄우면 됨 - 컬리 퍼플 박스, 컬리 소개, 컬리패스, 배송안내, 가입혜택보기 ( 프런트에서 작업 )
        - 쿠폰 API 만들어달라하기 ok
            - 무료배송, 3000원 할인, 10000원 할인
                - 쿠폰이름 : [무료배송] 3000원 할인 쿠폰
                - 쿠폰설명 : 20000만원 이상 주문시 3000원 할인 쿠폰
                - 만료일 : 아무렇게나 정해주세요!  ( 날짜 + 시간 )
                - 할인율 : 3000 ( Int로 고정 )
                - 쿠폰아이디 : 10
            - 5000원 할인
                - 쿠폰이름 : 전 상품에 모두 적용가능 5000원 할인 쿠폰
                - 쿠폰설명 : 첫 가입자에게 주는 혜택으로써 전 상품 적용가능한 쿠폰
                - 만료일 : 아무렇게나 정해주세요!  ( 날짜 + 시간 )
                - 할인율 : 5000 ( Int로 고정 )
                - 쿠폰아이디 : 11
            - 10000원 할인
                - 쿠폰이름 : [ 채소 한정 쿠폰 ]프레시 채소
                - 쿠폰설명 :  이 쿠폰은 한정 채소 상품에서 사용할 수 있습니다.
                - 만료일 : 아무렇게나 정해주세요!  ( 날짜 + 시간 )
                - 할인율 : 10000 ( Int로 고정 )
                - 쿠폰아이디 : 12
            - 쿠폰 사용했을 때 삭제도 가능해야할 것 같음
        - 설날특가 → 쿠폰 생성
        - 찜한상품 삭제
    - 스티브 : 상품 API 수정
        - ~~상품에 등록되어있는 coupon_name의 타입을 Int로 변경 ( 쿠폰Id가 필요 )  - coupon id로 변수명 변경, 타입 Int로 수정~~
        - ~~같이 쿠폰이 있는 상품에 어떤 쿠폰을 넣을지 얘기나누기~~
        - ~~찜한 목록에 아이템의 정보가 들어가야되서 샐리님과 얘기나눠보라고 말씀드리기~~
        - ~~낮은 가격순, 높은 가격순 정렬기준이 originPrice가 아니라 discountPrice이다. - 수정 완료~~
        - ~~특가상품 특가시작일만 작성해주시기로~~
- ~~10시까지 주문상세 만들기~~
- ~~주문 셀 나누기~~
- 쿠폰
    - ~~이벤트에서 쿠폰 다운로드를 눌렀을 때 화면 구현~~
    - ~~쿠폰다운로드~~
    - ~~쿠폰등록 알림창 구현~~
    - ~~쿠폰내역 보여주기 화면 구현~~
    - 쿠폰 버튼 눌렀을 때 바로 구현 ( 화면 이동만 하면 될 듯 )
- ~~이벤트화면 ( 특가/ 혜택 )~~
    - ~~특가/혜택의 이벤트 상세화면 구현~~
- ~~정렬하는 드롭박스 구현~~
- ~~배송지 선택 하프 모달 pod 'MaterialComponents/BottomSheet’~~
- ~~타이머구현~~
    - ~~서버에서 받아온 특가 상품 중 특가시작날짜가 오늘날짜와 동일하다면 오늘 날짜에서 남은 시간을 표시하기 + 해당 날짜의 특가 상품 띄우기~~
    - ~~만약 10분 이하로 남았을 경우 빨간색으로 띄움~~
    - ~~시간이 지났으면 만료표시하고 타이머 정지~~
        
        ![스크린샷 2022-01-19 오전 12.10.19.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/bc80127b-4437-423d-b8c2-958215b76060/스크린샷_2022-01-19_오전_12.10.19.png)
        
        ![스크린샷 2022-01-19 오전 12.10.30.png](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/20214f5c-b755-497c-bf3d-51a510c70d6c/스크린샷_2022-01-19_오전_12.10.30.png)
        
- ~~런치스크린~~
- ~~주문 내역 상세에서 배송 조회를 눌렀을 때 웹사이트로 연결~~
    - [https://www.freshsolutions.co.kr/main/delivery_check.php?invoice_no=220-H0-1612874912972-0001](https://www.freshsolutions.co.kr/main/delivery_check.php?invoice_no=220-H0-1612874912972-0001)
- ~~찜한 상품~~

### 12일차 개발일지

- ~~서버분들과 회의~~
    - ~~질문 사항 모두 여쭤보기~~
    - ~~샐리님과 회의~~
        - 적립, 찜 부분
    - ~~스티브님과 회의~~
        - 카테고리
        - API 최종본이 언제 나오는지 여쭤보기 ( 대충 일정이라도 )
- ~~알림설정~~
    - ~~거부, 동의 시 나오면 팝업창 ( 색상은 변경 못함 )~~
- ~~친구초대, 배너 이동,~~
- ~~전체등급 보기, 다음달 예상등급 보기~~
- ~~선물내역 텅  - 선물내역은 선물 받고 난 후 어떤 화면인지 몰라서 없을때 화면을 만들었습니다.~~
- ~~가격에 콤마 적용하는 거 찾기~~
- ~~취소선 표시~~
- ~~적립금~~
- ~~가입혜택화면 구현~~
- ~~컬리소개~~
- ~~배송안내~~
- ~~공지사항~~
- ~~고객센터~~
- ~~1:1 문의~~ (네비부분 수정안됬지만 ), 문의 작성
- ~~이용안내~~
- ~~컬리 퍼플박스, 컬리패스~~
- ~~API 엮기 ( 현재 완성된 API 위주로 )~~
    - ~~정렬리스트 부분 : 신상품(신상품순), 베스트(추천순,판매량순), 알뜰쇼핑(혜택순), 높은가격순, 낮은가격순~~
    - ~~리스트에서 쇼핑카트 클릭했을 때 모달로 띄우기~~
    - 문제 : 정렬 드롭다운 선택하고나서 데이터이 바뀌는 순간때문에 손실이 되거나, 느림
    
    ---
    
    - ~~공지사항 API 엮음~~
    
    ---
    

### 13일차-14일차 개발일지

- ~~회원 데이터 설계 ( UserInfoManager )~~
- ~~사용자 등급 조회 API 연동~~
- ~~회원 정보 띄우기~~
    - ~~등급 띄우기~~
    - ~~쿠폰갯수 띄우기~~
- ~~전체 이벤트 조회 API 연동~~
- ~~사용자 쿠폰 내역 조회 API 연동~~
- ~~쿠폰 내역 출력하기~~
- ~~사용자 쿠폰 id로 등록하기 API 연동 후 화면 출력 완료~~
- ~~특정 쿠폰 정보 API~~
- ~~특정 쿠폰 정보 API 화면 띄우기~~
- ~~이벤트에서 쿠폰 다운로드~~
- ~~로딩화면 , 주제별 전체 조회 API 연동~~
- ~~주제별 리스트 전체 조회  → count 받아오고 거기의 주제별 리스트의 정보들의 아이디를 이용해서~~
- ~~주제의 아이템 조회~~
- ~~아이템 모델을 만들어서 관리 ...  - 로딩화면에서 작업을 이미 시작함  ( ItemInfoManager )~~
- ~~홈화면 주제별로 띄우는 부분 API 되시면 연동해서 띄우기~~
- ~~상품 상세페이지에 API 연동해서 띄우기~~
- ~~전체 카테고리 조회~~
- ~~아이템 상세 정보 조회 ㅁ~~
- ~~공유화면~~
- ~~상품 후기 목록, 상품 후기 보기, 상품 문의 목록, 상품 문의 작성~~
- ~~마이컬리 (상품후기) - 작성가능후기, 작성완료후기~~

---

- 서버쪽에서 두개의 서버로 작업을 하다보니, 합치는 과정에서 오래걸려서 작업을 못함
- 서버 구축 과정에서 문제가 일어나서 데이터 손실때문에 디코딩이 안되는 상황
- 디코딩이 안되니까 다음 화면으로 안넘어가고 동작을 확인할 방법이 없음
- 대환장 마켓컬리 서비스점검..

---

- ~~찜(찜하기, 찜삭제하기, 찜내역보기),~~
- ~~배송지 추가, 배송지 조회, 특정 배송지조회, 배송지 수정, 배송지 삭제 연동~~

---

- ~~가격에 콤마 모두 수정~~
- API 안나옴
    - 화면만 구현함. 우선 연동은 보류 [개인정보 수정(보류), 대량주문 문의(보류), 후기 문의(보류)]
    - 화면 구현 못함, API도 안나옴 [ 자주하는 질문 ]
    - 검색API 안나옴
    - 카테고리 API 최종 안나옴
    - 기타 상품과 연관된 API 조금씩 수정이 필요한데 시간상 안될 것 같음
        ( 현재 나온 API 엮는게 우선인 것 같음 )
        

### 14일차 개발일지 ( 21 )

- ~~마켓컬리 서비스점검시간 + 서버안됨 작업하기가 어려운 상황~~
- ~~대본짜고 영상찍어서 제출 - 유튜브~~
    - 시간상 대본 짜지 못해서 바로 영상찍어 제출
- ~~팀원들과 얘기 끝에 추가작업을 통해 마무리를 하기루 결정~~
    - 프로젝트 작업 더 하기
    - 팀 깃 레포 파기
        - 리드미 작성하기

### 그 이후 개발일지

- 서버
    - ~~장바구니 삭제부분만 url 주소 /app 이 없음~~
    - ~~스티브님: 아이템 1-3번까지밖에 없는데 나머지도 복구 부탁드립니당~~
    - ~~그리고 아이템 쿠폰도 리스트에있는데, 상품들어가면 없어용 ( 맞춰주세요 )~~
    - ~~카트에 담은 아이템 정보들이 틀립니다 !~~
- ~~배송지 관련 부분 모두 마무리~~
- ~~장바구니 관련 부분 모두 마무리~~
    - 장바구니 삭제부분만 url 주소 /app 이 없음
- ~~주문~~
- ~~적립금~~
- ~~CartViewController → CellContent~~
    
    ~~이 부분 Nil이 수정되면 바꿔야됨 - 수정됨~~
    
    ```swift
    if target.getItemRes.discount_rate != nil {
                    
    } else {
                    
    }
    ```
    
- ~~셀 눌렀을때 회색으로 표시 → cell.selectionStyle = .none 으로 모두 수정~~
- ~~찜한 상품 - 장바구니 담기 있음 - 미구현~~
- 배송지 새로 등록할 때 주소검색에 해당하는 부분을 임의로 화면 수정했음 → 추후 카카오 API로 할 예정
- 마켓컬리 아이콘 만들기
- 장바구니 약간 수정이 필요 ( 후순위 )
- 검색어를 클릭했을 때 상세페이지로 이동

---

</div>
</details>


<details>
<summary>발생이슈 해결</summary>
<div markdown="6">        
    
---

### 질문 ( 발생이슈 )

### 오늘 서버에게 말하기

- ~~현재 전체 회원 조회 API 안됨~~
- 자주하는 질문 정보만 불러 올 수 있게 만들기 ( x )
- ~~공지사항 제목, 날짜만 (  내용까지 필요없음 )~~
- ~~신상품, 베스트, 알뜰쇼핑 API - 기준 잡아서 말씀해주시기~~
- ~~추천순, 높은가격순, 낮은가격순.. 등 정렬 부분~~
- ~~더미데이터 많이 생성 - 시간상 안될 것 같다고 하심~~
- ~~주제별로 데이터 넣어서 - 4-5개가 한계일 것 같음~~
- ~~서버 합치기 - 5~6시간째 걸림 ( 서버를 사용 못함 ..ㅠㅠ )~~
- ~~데이터 손실로 디코딩이 안됨 - 복구해달라고하기  ( 임시로 3개만 복구함 )~~
- ~~공지사항 더미데이터 넣어주기~~

### 개인적

- withIdentifier, identifier ?
- 회원가입, 로그인 → 비밀번호 동그라미로 표시
- 취소선
    
    ```swift
    // MARK: - 취소선
        func cancleLine(text: String, targetLabel: UILabel){
            let attributedString = NSMutableAttributedString(string: text)
            attributedString.addAttribute(.strikethroughStyle, value: 1.07, range: (text as NSString).range(of: text))
            targetLabel.attributedText = attributedString
        }
    ```
    

---

- ~~세자리수마다 콤마넣기~~
    
    ```swift
    // MARK: - 세자리 숫자마다 콤마 넣기
        func DecimalWon(value: Int) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            let result = numberFormatter.string(from: NSNumber(value: value))! + "원"
            
            return result
        }
    ```
    
- ~~switch → assert(**false**,"아님")~~
- ~~swift는 string을 배열처럼 짜를 수 없다.~~
    
    [https://ios-development.tistory.com/379](https://ios-development.tistory.com/379)
    
    ```swift
    str.substring(from: 0, to: 2)
    ```
    
- ~~타이머~~
    
    [https://fdee.tistory.com/entry/iOS-프로젝트TiTi-공부를-위한-타이머iOS-UPDATE](https://fdee.tistory.com/entry/iOS-%ED%94%84%EB%A1%9C%EC%A0%9D%ED%8A%B8TiTi-%EA%B3%B5%EB%B6%80%EB%A5%BC-%EC%9C%84%ED%95%9C-%ED%83%80%EC%9D%B4%EB%A8%B8iOS-UPDATE)
    
- ~~상단 배송지 선택 부분 ( 하프 모달 )~~
    
    'MaterialComponents/BottomSheet’
    
    [https://material.io/components/sheets-bottom/ios](https://material.io/components/sheets-bottom/ios)
    
    [https://gonslab.tistory.com/57](https://gonslab.tistory.com/57)
    
- ~~UICollectionReusableView에 해당하는 부분 ( 아울렛 연결  ) - Xib 만들어서 연결~~
    - Xib안만들고 그냥 띄울 경우
        
        ```swift
        //
        //  BestViewController.swift
        //  MarketKurlyApp
        //
        //  Created by 이하연 on 2022/01/10.
        //
        
        import UIKit
        import XLPagerTabStrip
        
        class BestViewController: UIViewController, IndicatorInfoProvider {
            
            var tabName: String = ""
            
            // MARK: - UIComponents
            @IBOutlet weak var collectionView: UICollectionView!
            
            // MARK: - LifeCycle
            override func viewDidLoad() {
                super.viewDidLoad()
                setUI()
            }
            
            override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()
            }
            
            // MARK: - Functions
            func indicatorInfo(for pagerTabStripController: PagerTabStripViewController) -> IndicatorInfo {
                return IndicatorInfo(title: "\(tabName)")
            }
            
            func setUI(){
                collectionView.dataSource = self
                collectionView.delegate = self
                registerNib(cellNibName: "Product2Cell", cellIdentifier: "product2Cell")
            }
            
            func registerNib(cellNibName: String, cellIdentifier: String){
                let newCellNib = UINib(nibName: cellNibName, bundle: nil)
                self.collectionView.register(newCellNib, forCellWithReuseIdentifier: cellIdentifier)
            }
            
        }
        
        extension BestViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
            func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
                return 50
            }
            
            func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
                switch kind {
                case UICollectionView.elementKindSectionHeader :
                    let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "bestHeaderView", for: indexPath)
                    return headerView
                default :
                    assert(false,"No")
                }
            }
            
            func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "product2Cell", for: indexPath) as? Product2Cell else {
                    return UICollectionViewCell()
                }
                return cell
            }
            
            
            //컬렉션뷰 사이즈 설정
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
                let margin:CGFloat = 25
                let cellRatio: CGFloat = 5/3
                let screenWidth = UIScreen.main.bounds.width
                let cellWidth =  (screenWidth-margin) / CGFloat(2)
                let cellHeight = cellWidth * cellRatio + 50
                return CGSize(width: cellWidth, height: cellHeight)
            }
            
        }
        ```
        
    - Xib 만들고 나서 ...
- ~~정렬하는 드롭다운~~
    
    [https://github.com/AssistoLab/DropDown](https://github.com/AssistoLab/DropDown)
    
- ~~신상품, 베스트, 알뜰쇼핑 부분 스크롤하면 한꺼번에 같이 올라가고 싶은데 따로 놈~~
    
    ScrollView안에 collectionView를 지정해서 생긴 문제였음
    
    collection reusable View로 해결
    
- ~~로그아웃할때 현재 개발한 상태로는 새로고침이 안됨~~
    
    빈 VC (색상없음) 으로 viewWillAppear시 dismiss하기
    
- ~~비 회원 → 회원으로 로그인할 때 탭바는 고정으로하고 화면이 변경되어야하는데 이루어지지 않음~~
    
    컨테이너뷰를 사용하여 분리
    
- ~~홈 화면 카테고리별 스와이프~~
    
    라이브러리 XLPagerTabStrip 사용 
    
- ~~회원가입할 때 라디오 버튼, 체크박스 부분~~
    
    라이브러리 DLRadioButton 사용 
    
    CheckBox → [https://sweetdev.tistory.com/527](https://sweetdev.tistory.com/527)
    
- ~~주문내역에서 테이블셀 사이의 간격 조절 -  tableViewCell에 func layoutSubviews 를 사용~~
    
    ```swift
    override func layoutSubviews() {
            super.layoutSubviews()
            contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    ```
    
- ~~네비게이션 탭바 뒤로가기를 구현했더니 다시 루트뷰로 돌아갔을 때 네비게이션 색상이 변경이 안됨~~
    
    LifeCycle를 이용하여 호출되는 타이밍에 색상을 변경해주었음, 또, 애초에 화면이동하는 코드에서 다음 화면의 NavigationVC로 이동할지 ( present ), NavigationVC를 가지고 있지만 본인 화면으로 이동할지 ( presnet , push ) 등에서 꼬였던 부분도 있음 - 흐름을 잘못 파악해서 삽질을 많이함
    
- ~~상품 상세페이지로 화면 전환할때 Push하면 뒤로가기 버튼이 안나타남~~
    
    Left Items Supplment를 체크해주고, Back Button 공백 하나를 입력
    
    ![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/61e1fd98-2881-4567-8ed5-78bde27993dc/Untitled.png)
    
- ~~stepper 모양이 다름 - 커스텀~~
    
    이 부분은 라이브러리를 사용하고 커스텀하여 만듬 
    
    ### 스탬프 라이브러리
    
    [https://github.com/gmertk/GMStepper](https://github.com/gmertk/GMStepper)
    
- ~~로그인 상단 팝업 알림창 - 커스텀~~
    
    [https://github.com/wxxsw/GSMessages](https://github.com/wxxsw/GSMessages)
    
- ~~테이블 셀을 누르면 확장되게 만들기~~
    
    [https://github.com/okhanokbay/ExpyTableView](https://github.com/okhanokbay/ExpyTableView)
    
- ~~테이블뷰 선택 색상 없애기~~
    
    ```swift
    cell.selectionStyle = .none
    ```
    
- ~~상품 상세페이지, 찜, 구매부분 맨 앞으로 가져오기~~
    
    ```swift
    **self**.view.bringSubviewToFront(**self**.fixView)
    ```
    
- ~~버튼 클릭시 이미지 변경~~
    
    ```swift
    @IBAction func allAgreementBtn(_ sender: UIButton!) {
            sender.isSelected.toggle()
        }
    ```
    
- ~~url을 이미지로 변경하기 ( kingfisher )~~
    
    ```swift
    if let url: URL = URL(string: "https://i.ibb.co/TTQhmV2/047e9de093bf48d2953e8b2d64a95120.png" ){
                imageDetailImgView.kf.indicatorType = .activity
                imageDetailImgView.kf.setImage(with:url)
            }
    ```
    
- ~~뷰 안에 선 긋기~~
    
    ```swift
    import UIKit
    
    extension CALayer {
        func addBorder(_ arr_edge: [UIRectEdge], color: UIColor, width: CGFloat) {
            for edge in arr_edge {
                let border = CALayer()
                switch edge {
                    case UIRectEdge.top:
                    border.frame = CGRect.init(x: 0, y: 0, width: frame.width, height: width)
                    break case
                    UIRectEdge.bottom:
                    border.frame = CGRect.init(x: 0, y: frame.height - width, width: frame.width, height: width)
                    break case
                    UIRectEdge.left:
                    border.frame = CGRect.init(x: 0, y: 0, width: width, height: frame.height)
                    break case
                    UIRectEdge.right: border.frame = CGRect.init(x: frame.width - width, y: 0, width: width, height: frame.height)
                    break default:
                    break
                }
                border.backgroundColor = color.cgColor;
                self.addSublayer(border)
            }
        }
    }
    
    //적용 방법 
    your_view.layer.addBorder([.top, .bottom], color: UIColor.white, width: 1.0) 
    
    //주의! viewDidAppear()<- 에 적용해야 선이 그려집니다.
    
    ```
    
- ~~이미지에서 색상 추출하여 hex로 가져오는 사이트~~
    
    [https://ko.rakko.tools/tools/64/](https://ko.rakko.tools/tools/64/)
    
- ~~한줄로 조건문 쓰기~~
    
    ```swift
    var msg = number >= 20 ? "higger" : "lesser"
    ```
    
- ~~새로고침~~
    
    [https://scshim.tistory.com/149](https://scshim.tistory.com/149)
    
- ~~텍스트필드 액션~~
    
    [https://42kchoi.tistory.com/272](https://42kchoi.tistory.com/272)
    
- ~~태그 리스트 만들기~~
    
    [https://apple-apeach.tistory.com/74](https://apple-apeach.tistory.com/74)
    
    [https://magi82.github.io/ios-intrinsicContentSize/](https://magi82.github.io/ios-intrinsicContentSize/)
    
    [https://velog.io/@seondal/iOS-Collection-View-Cell-크기를-컨텐츠에-따라-바뀌게-하기](https://velog.io/@seondal/iOS-Collection-View-Cell-%ED%81%AC%EA%B8%B0%EB%A5%BC-%EC%BB%A8%ED%85%90%EC%B8%A0%EC%97%90-%EB%94%B0%EB%9D%BC-%EB%B0%94%EB%80%8C%EA%B2%8C-%ED%95%98%EA%B8%B0)
    
    [https://github.com/seondal](https://github.com/seondal)
    
- ~~네비게이션 바 버튼 간격 - 커스텀~~
    
    버튼 2개로 했음
    
    - 첫번째 방식
        
        ```swift
        func customNaviBarItem(btnColor: UIColor, naviItem: UINavigationItem){
        
                lazy var mapLeftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
                    $0.setImage(UIImage(systemName: "map"), for: .normal)
                    $0.tintColor = btnColor
                    $0.addTarget(self, action: #selector(self.addressBarBtnTapped(_:)), for: .touchUpInside)
                }
                lazy var cartRightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
                    $0.setImage(UIImage(systemName: "cart"), for: .normal)
                    $0.tintColor = btnColor
                    $0.addTarget(self, action: #selector(self.cartBarBtnTapped(_:)), for: .touchUpInside)
                }
                let leftBarBtnItem = UIBarButtonItem(customView: mapLeftBtn)
                let rightBarBtnItem = UIBarButtonItem(customView: cartRightBtn)
                
                rightBarBtnItem.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 10)
                naviItem.rightBarButtonItems = [rightBarBtnItem,leftBarBtnItem]
                
            }
            
            
            @objc func addressBarBtnTapped(_ sender: AnyObject) {
                
            }
            
            @objc func cartBarBtnTapped(_ sender: AnyObject) {
                
            }
        ```
        
    - 두번째 방식
        
        ```swift
        func customNaviBarItem(btnColor: UIColor, naviItem: UINavigationItem){
        
                lazy var mapLeftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
                    $0.setImage(UIImage(systemName: "map"), for: .normal)
                    $0.tintColor = btnColor
                    $0.addTarget(self, action: #selector(self.addressBarBtnTapped(_:)), for: .touchUpInside)
                }
                lazy var cartRightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 10, height: 10)).then {
                    $0.setImage(UIImage(systemName: "cart"), for: .normal)
                    $0.tintColor = btnColor
                    $0.addTarget(self, action: #selector(self.cartBarBtnTapped(_:)), for: .touchUpInside)
                }
                let leftBarBtnItem = UIBarButtonItem(customView: mapLeftBtn)
                let rightBarBtnItem = UIBarButtonItem(customView: cartRightBtn)
                
                let space = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target: self, action: nil)
                space.width = 15
                naviItem.rightBarButtonItems = [rightBarBtnItem,space,leftBarBtnItem]
                
            }
            
            
            @objc func addressBarBtnTapped(_ sender: AnyObject) {
                
            }
            
            @objc func cartBarBtnTapped(_ sender: AnyObject) {
                
            }
        ```
        
- ~~기본 코드~~
    - 기본 코드
        
        ```swift
        class AddressListCell: UITableViewCell {
            
        		// MARK: - Components
        
            // MARK: - LifeCycle
            override func awakeFromNib() {
                super.awakeFromNib()
                setUI()
            }
            
            override func setSelected(_ selected: Bool, animated: Bool) {
                super.setSelected(selected, animated: animated)
            }
            
            // MARK: - Functions
            func setUI(){
                
            }
        }
        ```
        
        ```swift
        extension AddressManagmentViewController: UITableViewDelegate, UITableViewDataSource {
            func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
                return 2
            }
            
            func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                guard let cell = tableView.dequeueReusableCell(withIdentifier: "AddressListCell", for: indexPath) as? AddressListCell else {
                    return UITableViewCell()
                }
                return cell
            }
            
        }
        ```
        
        ```swift
        // MARK: - Components
            
            // MARK: - LifeCycle
            override func viewDidLoad() {
                super.viewDidLoad()
                setUI()
            }
            
            // MARK: - Functions
            func setUI(){
                
            }
        ```
        
    - 화면 이동
        
        ```swift
        let storyboard = UIStoryboard(name: "Item", bundle: nil)
        let ItemDetailVC = storyboard.instantiateViewController(identifier: "ItemDetailSB")
        ItemDetailVC.modalPresentationStyle = .fullScreen
        ```
        
        ```swift
        let storyboard = UIStoryboard(name: "Login", bundle: nil)
        guard let IdResultVC = storyboard.instantiateViewController(identifier: "IdResultSB") as? IdResultViewController else { return }
        IdResultVC.userId = self.findUserIdx!
        self.navigationController?.pushViewController(IdResultVC, animated: true)
        ```
        

### 우노 ( 멘토 )

- 네비게이션 탭바에 이미지를 넣어서 커스텀하려고 했으나, 크기 조정이 실패함 ( 후순위 ) - ok
- 우노 - 이 상품 어때요 특정 셀의 제목텍스트 보이는 상태가 실제앱이랑 좀 다름( 후작업 )  - ok
- ~~배송지 새로 등록할 때 주소검색에 해당하는 부분을 임의로 화면 수정했음 → 추후 카카오 API로 할 예정~~
- ~~배송지 선택 하프 모달~~
    
    바텀시트라이브러리 사용하기 
    

---

- ~~delegate, MVVM 패턴 강의를 해주심 👍~~
- ~~서버와의 통신 부분 분리~~
    - 서버와 연동하기 전 화면 구상할 때 더미데이터를 넣어야 될 텐데
- ~~홈 화면에서 MD의 추천 부분 빼고 진행하기~~
- ~~최근 검색어 태그 부분 너비를 동적으로 할당~~
    
    텍스트의 길이를 받아와서 너비 지정 
    
- ~~내비게이션 백그라운드 변경~~
    
    ```swift
    func customNavigationBarAttribute(_ backgroundColor: UIColor,
                                          _ titleColor: UIColor) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = backgroundColor
            appearance.titleTextAttributes = [.foregroundColor: titleColor]
            appearance.shadowColor = .clear
            self.navigationController?.navigationBar.standardAppearance = appearance
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        }
    ```
    
- ~~API 명세서 보여주면서 정렬(신상품,베스트,알뜰쇼핑,추천순... 등)하는 부분~~
    - ~~서버에서 하는 게 맞는지, 클라이언트에서 하는 게 맞는지 ⇒ 서버~~
- ~~아이템 상세페이지로 이동할 때 옆으로 이동하는 부분에서 발생하는 문제~~
    - push 동작이 되어야하는데 탭바가 아래에 그대로 남음 - 탭바 숨기면 됨
        
        띄울 화면의 WillAppear, Disapper에 작성해주면 됨
        
        ```swift
        self.tabBarController?.tabBar.isHidden = true
        ```
        
    - modal로 띄우고, push할 때와 같은 애니메이션 동작 - 비추 ( 최후의 수단 )
- ~~네비게이션 화면전환(push)할 때 자동으로 생성되는 왼쪽 백버튼 부분~~
    
    자동으로 왼쪽 백버튼이 나오면, 색상과 navigationBar의 타이틀을 없애면 됨.
    
    ```swift
    func naviTitleDelete(navi: UINavigationController){
            navi.navigationBar.tintColor = .black
            navi.navigationBar.topItem?.title = ""
        }
    ```
    
- ~~스크롤뷰에서 동적으로 높이 조절을 하고 싶음~~
    
    동적으로 높이가 조절되는 StackView를 활용하면 됨 
    
- ~~셀마다 동적으로 높이 조절하고 싶음~~
    
    UITableView.automaticDimension 을 적용해주면 됨 ( 단, 스토리보드에서 제약조건을 잘 설정되야됨 )
    
- ~~버전 15이상일 경우 발생하는 네비게이션 배경색상, 타이틀색상 이슈~~
    
    ```swift
    self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    ```
</div>
</details>
