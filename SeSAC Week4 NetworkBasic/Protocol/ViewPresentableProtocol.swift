

import Foundation
import UIKit


//프로토콜은 규약이자 필요한 요소를 명시만 할 뿐, 실질적인 구현은 하지않는다.
//실질적인 구현은 포로토콜을 채택한 타입에서 구현한다.
//클래스, 구조체, 익스텐션, 열거형 ...
//클래스는 단일 상속만 가능하지만, 프로토콜은 채택 갯수에 제한이 없다.
//@objc optional > 선택적 요청(Optional Requirement)

//프로토콜 프로퍼티 : 연산 프로퍼티로 쓰던 저장 프로퍼티로 쓰던 상관하지 않는다.
//명시하지 않기에, 구현을 할 때 프로퍼티를 저장 프로퍼티로 쓸 수도 있고 연산 프로퍼티로 사용할 수도 있다.
//무조건 var로 선언해야 한다.

//만약 get만 명시했다면, get 기능만 최소 구현하면 된다. 필요하면 set도 구현해도 괜찮음.

@objc protocol ViewPresentableProtocol {
    
    var navigationTitleString: String { get set }
    var backgroundColor: UIColor { get }
    static var identifier: String { get }
    
    func configureView()
    @objc optional func configureLabel()
    @objc optional func configureTextField()
}

@objc protocol MJTableViewProtocol {
    
    func numberOfRowsInSection() -> Int
    func cellForRowAt(indexPath: IndexPath) -> UITableViewCell
    @objc optional func didSelectRowAt()
    
}







