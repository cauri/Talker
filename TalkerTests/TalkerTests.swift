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

    func test_whenTappingSettingsButton_showsSettingsPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // 1. use Fleet to mock the view controller that is bound to an identifier in the storyboard
        // 2. refer to a class type: <class_name>.self
        let settingsViewController = try! storyboard.mockIdentifier("SettingsViewController", usingMockFor: SettingsViewController.self)

        let viewController = storyboard.instantiateViewController(withIdentifier: "TalkerViewController") as! TalkerViewController

        Fleet.setAsAppWindowRoot(viewController)

        try! viewController.settingsButton!.tap()

        // assert that the settings view controller is now visible on the screen
        expect(Fleet.getApplicationScreen()?.topmostViewController).toEventually(beIdenticalTo(settingsViewController))
    }

    func test_whenTappingTalkerButton_showsTalkerPage() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        // 1. use Fleet to mock the view controller that is bound to an identifier in the storyboard
        // 2. refer to a class type: <class_name>.self
        let talkerViewController = try! storyboard.mockIdentifier("TalkerViewController", usingMockFor: TalkerViewController.self)

        let viewController = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController

        Fleet.setAsAppWindowRoot(viewController)

        try! viewController.talkerButton!.tap()

        // assert that the settings view controller is now visible on the screen
        expect(Fleet.getApplicationScreen()?.topmostViewController).toEventually(beIdenticalTo(talkerViewController))
    }

}
