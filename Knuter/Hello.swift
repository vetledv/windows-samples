import Observation

@Observable
class Hello {
    static let shared = Hello()
    var asd = "Hello windows from swift"
    var counter = 0
}
