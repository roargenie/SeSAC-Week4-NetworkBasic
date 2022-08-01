
import Foundation

//enum StoryboardName: String {
//    case Main
//    case Search
//    case Setting
//}

struct StoryboardName {
    
    private init() {}
    
    static let main = "Main"
    static let search = "Search"
    static let setting = "Setting"
    
}

/*
 1. struct type property vs enum type property => 인스턴스 생성을 방지할 수 있다.
 
 */
//enum StoryboardName {
//    static let main = "Main"
//    static let search = "Search"
//    static let setting = "Setting"
//}

enum FontName {
    static let title = "SanFransisco"
    static let body = "SanFransisco"
    static let caption = "AppleSendol"
    
}


