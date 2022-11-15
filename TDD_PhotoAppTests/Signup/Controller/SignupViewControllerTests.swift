//
//  SignupViewControllerTests.swift
//  TDD_PhotoAppTests
//
//  Created by AnhNguyen on 14/11/2022.
//

import XCTest
@testable import TDD_PhotoApp

class SignupViewControllerTests: XCTestCase {
    
    var storyboard: UIStoryboard!
    var sut: SignupViewController!
    
    override func setUp() {
        storyboard = UIStoryboard(name: "Main", bundle: nil)
        sut = storyboard.instantiateViewController(identifier: "SignupViewController") as? SignupViewController
        sut.loadViewIfNeeded()
    }
    
    override func tearDown() {
        
    }

    func testSignupViewController_WhenCreated_HasRequiredTextFieldsEmpty() throws {
        // Given
        let firstNameTextField = try XCTUnwrap(sut.firstNameTextField, "The firstNameTextField is not connected to an IBOutlet")
        let lastNameTextField = try XCTUnwrap(sut.lastNameTextField, "The lastNameTextField is not connected to an IBOutlet")
        let emailTextField = try XCTUnwrap(sut.emailTextField, "The emailTextField is not connected to an IBOutlet")
        let passwordTextField = try XCTUnwrap(sut.passwordTextField, "The passwordTextField is not connected to an IBOutlet")
        let repeatPasswordTextField = try XCTUnwrap(sut.repeatPasswordTextField, "The repeatPasswordTextField is not connected to an IBOutlet")
        
        // Then
        XCTAssertEqual(firstNameTextField.text, "", "First name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(lastNameTextField.text, "", "Last name text field was not empty when the view controller initially loaded")
        XCTAssertEqual(emailTextField.text, "", "Email text field was not empty when the view controller initially loaded")
        XCTAssertEqual(passwordTextField.text, "","Password text field was not empty when the view controller initially loaded")
        XCTAssertEqual(repeatPasswordTextField.text, "","Repeat Password text field was not empty when the view controller initially loaded")
    }

    func testViewController_WhenCreated_HasSignupButtonAndAction() throws {
        // Given
        let signupButton: UIButton = try XCTUnwrap(sut.signupButton, "The signupButton is not connected to an IBOutlet")
        
        // When
        let signupButtonActions = try XCTUnwrap(signupButton.actions(forTarget: sut, forControlEvent: .touchUpInside), "Signup button does not have any actions assigned to it")
        
        // Then
        XCTAssertEqual(signupButtonActions.count, 1)
        XCTAssertEqual(signupButtonActions.first, "signupButtonTapped:", "There is no action with a name signupButtonTapped assigned to signup button")
    }
    
    func testViewController_WhenSignupButtonTapped_InvokesSignupProcess() {
        // Given
        let mockSignupModelValidator = MockSignupModelValidator()
        let mockSignupWebService = MockSignupWebService()
        let mockSignupViewDelegate = MockSignupViewDelegate()
        
        let mockSignupPresenter = MockSignupPresenter(formModelValidator: mockSignupModelValidator, webservice: mockSignupWebService, delegate: mockSignupViewDelegate)
        
        sut.signupPresenter = mockSignupPresenter
        
        // When
        sut.signupButton.sendActions(for: .touchUpInside)
        
        // Then
        XCTAssertTrue(mockSignupPresenter.processUserSignupCalled, "The processUserSignup() method was not called on a Presenter object when the signup button was tapped in a SignupViewController")
    }
}
