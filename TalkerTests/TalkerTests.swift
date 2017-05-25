import XCTest
import Nimble
import Fleet
import AVFoundation

@testable import Talker

class MockTalker: Talker {
    var sayMethodCalledWith: String = ""
    
    override func say(words: String) {
        sayMethodCalledWith = words
    }
}

class TalkerTests: XCTestCase {
    func test_whenEnteringTextIntoTheTextFieldAndPressingTalkButton_displaysInputTextInALabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TalkerViewController") as! TalkerViewController
        
        Fleet.setAsAppWindowRoot(viewController)
        
        try! viewController.textField?.enter(text: "hello everyone")
        try! viewController.button?.tap()
        
        expect(viewController.talkBackLabel?.text).to(equal("hello everyone"))
    }
    
    func test_whenEnteringTextIntoTheTextFieldAndPressingTalkButton_passesTextToTalker() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TalkerViewController") as! TalkerViewController
        
        Fleet.setAsAppWindowRoot(viewController)
        
        let mockTalker = MockTalker()
        viewController.talker = mockTalker
        
        try! viewController.textField?.enter(text: "hello everyone")
        try! viewController.button?.tap()
        
        expect(mockTalker.sayMethodCalledWith).to(equal("hello everyone"))
    }
}
