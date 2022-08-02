
import Foundation

struct APIKey {
    static let BOXOFFICE = "dd222387d3ba77a6eda7ca5700308154"
    static let NAVER_ID = "jUtC07YiMaqMxpH6sxQn"
    static let NAVER_SECRET = "aDRbGQgOhF"
    static let OPENWEATHER = "41518324a496c4d5dcf3b4ff0f97f046"
    static let TMDB = "02d814cdbbc52648edae9227b58c1049"
    static let KAKAO = "d1fe80a72eaf89a7dada92cf75d08ce8"
}

struct EndPoint {
    static let boxOfficeURL = "http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?"
    static let lottoURL = "https://www.dhlottery.co.kr/common.do?method=getLottoNumber"
    static let papagoURL = "https://openapi.naver.com/v1/papago/n2mt"
    static let beerURL = "https://api.punkapi.com/v2/beers"
}


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


