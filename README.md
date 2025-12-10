# ChoolCheck

> SwiftUI와 SwiftData를 활용한 출석 관리 앱

[![Swift](https://img.shields.io/badge/Swift-5.9+-orange.svg)](https://swift.org)
[![iOS](https://img.shields.io/badge/iOS-17.0+-lightgrey.svg)](https://www.apple.com/ios/)
[![SwiftUI](https://img.shields.io/badge/SwiftUI-5.0-blue.svg)](https://developer.apple.com/xcode/swiftui/)

---

## 프로젝트 소개

iOS 17에서 새롭게 도입된 SwiftData 프레임워크를 학습하기 위해 제작한 출석 관리 앱입니다.

- **제작 기간**: 2023년 10월 14일 (1일간)
- **제작 목적**: SwiftData 프레임워크 학습 및 실습. 그리고 취미 모임 운영시에 모임 구성원의 출석을 편하게 관리하는데 내가 사용하려고 만듦.
- **프로젝트 상태**: 초기 개발 단계 (기본 구조 구현)
  - 본래 제작 목적이었던 출석관리 용도로의 사용이 더이상 필요하지 않게 되어, SwiftData 학습을 위한 기본 구조 구현까지만 진행하고 프로젝트 중단.

---

## 주요 기능

### 현재 구현된 기능
- 출석부 목록 조회
- 멤버 정보 표시 (닉네임, 이름, 가입일)
- 멤버 삭제 (Swipe to Delete)

### 계획된 기능 (미구현)
- 출석 체크 기능
- 출석 기록 조회
- VisionKit을 활용한 명단 스캔 기능

---

## 기술 스택

### 프레임워크
- **SwiftUI** - 선언형 UI 프레임워크
  - TabView를 활용한 화면 구성
  - List를 활용한 멤버 목록 표시
  - NavigationView를 활용한 화면 전환

- **SwiftData** - iOS 17 신규 데이터 프레임워크
  - `@Model` 매크로를 활용한 데이터 모델 정의
  - `@Query` Property Wrapper를 통한 데이터 조회
  - `ModelContainer`를 통한 데이터 영속성 관리
  - Core Data의 현대적 대체재

### 아키텍처
- **SwiftUI 기반**
- **MVVM 패턴**
- SwiftData의 `@Model` 매크로 활용

---

## 프로젝트 구조

```
ChoolCheck/
├── ChoolCheckApp.swift           # 앱 진입점
├── Scenes/
│   ├── ContentView.swift         # 메인 탭 뷰
│   └── AttendanceListScene.swift # 출석부 목록 화면
├── DB/
│   └── Member.swift              # SwiftData 멤버 모델
└── PreviewContents/
    ├── SampleMember.swift        # 미리보기용 샘플 데이터
    └── PreviewContainer.swift    # 미리보기용 컨테이너
```

---

## SwiftData 구현

### 1. 데이터 모델 정의

```swift
@Model
final class Member {
    @Attribute(.unique) var id: UUID
    var nickName: String
    var name: String?
    var joinDate: Date
    var birthDate: Date?
    var attendanceDate: [Date]

    init(id: UUID, nickName: String, name: String?,
         joinDate: Date, birthDate: Date?, attendanceDate: [Date]) {
        self.id = id
        self.nickName = nickName
        self.name = name
        self.joinDate = joinDate
        self.birthDate = birthDate
        self.attendanceDate = attendanceDate
    }
}
```

### 2. ModelContainer 설정

```swift
@main
struct ChoolCheckApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Member.self)
    }
}
```

### 3. 데이터 조회 및 삭제

```swift
struct AttendanceListScene: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var members: [Member]

    var body: some View {
        List {
            ForEach(members) { member in
                HStack {
                    Text(member.nickName)
                    Text(member.name ?? "")
                }
            }
            .onDelete(perform: delete)
        }
    }

    func delete(set: IndexSet) {
        for index in set {
            modelContext.delete(members[index])
        }
    }
}
```

---

## 학습 내용

이 프로젝트를 통해 다음을 학습했습니다:

### SwiftData
- `@Model` 매크로를 활용한 데이터 모델 정의
- `@Attribute(.unique)`를 통한 고유 속성 지정
- `@Query` Property Wrapper를 통한 선언적 데이터 조회
- `ModelContainer`와 `modelContext`를 통한 데이터 관리
- SwiftUI Preview에서 SwiftData 활용하기

### SwiftUI
- TabView를 활용한 탭 기반 네비게이션
- `@Environment(\.modelContext)`를 통한 컨텍스트 주입
- List의 `onDelete` modifier를 활용한 삭제 기능

---

## Core Data vs SwiftData

이 프로젝트는 기존 Core Data 대신 Swift 네이티브한 SwiftData를 사용합니다:

| Core Data | SwiftData |
|---|---|
| `NSManagedObject` | `@Model` 매크로 |
| `NSFetchRequest` | `@Query` |
| `NSManagedObjectContext` | `ModelContext` |
| Objective-C 기반 | Swift 네이티브 |
| 복잡한 설정 | 간결한 구문 |

---

## 실행 방법

### 요구 사항
- Xcode 15.0+
- iOS 17.0+
- Swift 5.9+

### 실행

```bash
# 1. 저장소 클론
git clone https://github.com/MunokKim/ChoolCheck.git

# 2. 프로젝트 열기
cd ChoolCheck
open ChoolCheck.xcodeproj

# 3. Xcode에서 실행 (⌘ + R)
```

**참고**: SwiftData는 iOS 17부터 지원되므로, iOS 17 이상의 시뮬레이터나 실기기에서 실행해야 합니다.

---

## 향후 개선 계획

- [ ] 출석 체크 기능 구현
- [ ] 출석 기록 조회 및 통계
- [ ] VisionKit을 활용한 명단 스캔 기능
- [ ] 멤버 추가/수정 화면
- [ ] 출석률 계산 및 표시
