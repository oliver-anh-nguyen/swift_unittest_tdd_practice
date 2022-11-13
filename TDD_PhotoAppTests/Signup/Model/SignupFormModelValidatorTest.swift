//
//  SignupFormModelValidator.swift
//  TDD_PhotoAppTests
//
//  Created by AnhNguyen on 12/11/2022.
//

import XCTest
@testable import TDD_PhotoApp

class SignupFormModelValidatorTest: XCTestCase {
    
    var sut: SignupFormModelValidator!
    
    override func setUp() {
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() {
        // Given
        //let sut = SignupFormModelValidator()
        
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "Oliver")
        
        // Then
        XCTAssertTrue(isFirstNameValid, "The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse() {
        // Given
        //let sut = SignupFormModelValidator()
        
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "O")
        
        // Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is shorter than \(SignupConstants.firstNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse() {
        // Given
        // When
        let isFirstNameValid = sut.isFirstNameValid(firstName: "OliverOliver")
        
        // Then
        XCTAssertFalse(isFirstNameValid, "The isFirstNameValid() should have returned FALSE for a first name that is longer than \(SignupConstants.firstNameMaxLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenEqualPasswordsProvided_ShouldReturnTrue() {
        // Given
        
        // When
        let doPasswordMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"12345678")
        
        // Then
        XCTAssertTrue(doPasswordMatch, "The doPasswordMatch() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenNotMatchingPasswordsProvided_ShouldReturnFalse() {
        // Given
        
        // When
        let doPasswordMatch = sut.doPasswordsMatch(password: "12345678", repeatPassword:"1234567")
        
        // Then
        XCTAssertFalse(doPasswordMatch, "The doPasswordMatch() should have returned FALSE for passwords but that do not match but it has returned TRUE")
    }

}
