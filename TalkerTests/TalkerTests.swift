import XCTest
import Nimble
import Fleet
import AVFoundation

@testable import Talker

class TalkerTests: XCTestCase {
    func test_whenEnteringTextIntoTheTextFieldAndPressingTalkButton_displaysInputTextInALabel() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "TalkerViewController") as! TalkerViewController
        
        Fleet.setAsAppWindowRoot(viewController)
        
        try! viewController.textField?.enter(text: "hello everyone")
        try! viewController.button?.tap()
        
        expect(viewController.talkBackLabel?.text).to(equal("hello everyone"))
    }
    func test_whenEnteringTextIntoTheTextFieldAndPressingTalkButton_passesTextToSynthesizer() {
//        let synthesizer = AVSpeechSynthesizer()
//        let utterance = AVSpeech(string:"hello")

//        expect(
    }
}
