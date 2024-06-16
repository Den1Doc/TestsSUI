//import XCTest
//
//final class UITestUITests: XCTestCase {
//    
//    let app = XCUIApplication()
//
//    override func setUpWithError() throws {
//        continueAfterFailure = false
//        app.launch()
//    }
//
//    override func tearDownWithError() throws { }
//
//    
//    func test_UITestingBootcampView_signUpButton_shouldNotSignIn() {
//        let textField = app.textFields["SignUpTextField"]
//        textField.tap()
//
//        let returnButton = app.buttons["Return"]
//        returnButton.tap()
//    
//        le = app.buttons["SingUpButton"]
//        signUpButton.tap()
//        
//        let navBar = app.navigationBars["Welcom!"]
//        
//        XCTAssertFalse(navBar.exists)
//    }
//   
//    
//    func test_UITestingBootcampView_signUpButton_shouldSignIn() {
//        let textField = app.textFields["SignUpTextField"]
//        textField.tap()
//        
//        let aKey = app.keys["Aaa"]
//        aKey.tap()
//
//        let returnButton = app.buttons["Return"]
//        returnButton.tap()
//    
//        let signUpButton = app.buttons["SingUpButton"]
//        signUpButton.tap()
//        
//        let navBar = app.navigationBars["Welcom!"]
//        
//        XCTAssert(navBar.exists)
//        
//    }
//    
//    func test_SignedInHomeView_showAlertButton_shouldDisplayAlert() {
//        
//    }
//    
////    func test_SignedInHomeView_showAlertButton_shouldDisplayAndDismissAlert() {
////
////        let textField = app.textFields["SignUpTextField"]
////        textField.tap()
////
////        let aKey = app.keys["A"]
////        aKey.tap()
////
////        let returnButton = app.buttons["Return"]
////        returnButton.tap()
////
////        let signUpButton =  app.buttons["SingUpButton"]
////        signUpButton.tap()
////
////        let navBar = app.navigationBars["Welcom!"]
////        XCTAssertTrue(navBar.exists)
////
////        let alertButton = app.buttons["Show welcom alter"]
////        alertButton.tap()
////
////        let alert = app.alerts["Welcom to the app!"]
////        XCTAssertTrue(alert.exists)
////
////        let alertOKButton = alert.buttons["OK"]
////        XCTAssertTrue(alert.exists)
////        sleep(1)
////        alertOKButton.tap()
////        sleep(1)
////
////        XCTAssertFalse(alert.exists)
////
////
////
////
////    }
//    
//}
