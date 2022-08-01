



import UIKit

class MapViewController: UIViewController {
    
    
    // Notification 1.
    let notificationCenter = UNUserNotificationCenter.current()
    
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Custom Font
        for i in UIFont.familyNames {
            print("========\(i)=========")
            
            for name in UIFont.fontNames(forFamilyName: i) {
                print(name)
            }
        }
        
        requestAuthorization()
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        sendNotification()
        
    }
    
    // Notification 2. 권한 요청
    func requestAuthorization() {
        
        let authorizationOptions = UNAuthorizationOptions(arrayLiteral: .alert, .badge, .sound)
        
        notificationCenter.requestAuthorization(options: authorizationOptions) { success, error in
            
            if success {
                self.sendNotification()
            }
            
        }
    }
    
    // Notification 3. 권한 허용한 사용자에게 알림 요청(언제? 어떤 컨텐츠?)
    /*
     iOS 시스템에서 알림을 담당 > 알림을 등록해줘야 함.
     - 권한 허용 해야만 알림이 온다.
     - 권한 허용 문구 시스템적으로 최초 한 번만 뜬다.
     - 허용이 안 된 경우 설정으로 유도하는 코드를 구성해야 한다.
     - 기본적으로 알림은 포그라운드에서 수신되지 않는다.
     - 로컬 알림에서 인터벌 60초 이상 반복 가능 / 갯수 제한 64개 / 커스텀 사운드
     
     1. 뱃지 제거?(신 델리게이트 생명주기관련)
     2. 노티 제거?(노티 클릭시 모든 노티 제거 > 카톡)
     3. 포그라운드 수신? -> 델리게이트 메서드로 해결
     
     +@
     - 노티는 앱 실행이 기본인데, 특정 노티를 클릭할 때 특정 화면으로 가고 싶다면?
     - 포그라운드 수신시 특정 홯면에서는 안받고 특정 조건에 대해서만 포그라운드 수신을 하고 싶다면?(예: 카톡)
     - iOS15 집중모드 등 우선순위가 있음.
     */
    func sendNotification() {
        let notificationContent = UNMutableNotificationContent()
        
        notificationContent.title = "다마고치를 키워보세요"
        notificationContent.subtitle = "오늘 행운의 숫자는 \(Int.random(in: 1...100))입니다."
        notificationContent.body = "저는 따끔따끔 다마고치 입니다. 배고파요."
        notificationContent.badge = 40
        
        // 언제 보낼 것인가? 1. 시간 간격 2. 캘린더 3. 위치
        // 시간 간격은 60초 이상 설정해야 함
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
        //var dateComponents = DateComponents()
        //dateComponents.minute = 15
        
        //let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        // 알림 요청
        // 알림 관리를 할 필요 X -> 알림 클릭하면 앱을 켜주는 정도.
        // 알림 관리를 할 필요 O -> +1, 고유 이름, 규칙 등
        let request = UNNotificationRequest(identifier: "\(Date())", content: notificationContent, trigger: trigger)
        
        notificationCenter.add(request)
    }
    
    
}
