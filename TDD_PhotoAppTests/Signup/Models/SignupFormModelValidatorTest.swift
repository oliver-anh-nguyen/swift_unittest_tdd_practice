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

    // MARK: First Name Validation Unit Tests
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
    
    // MARK: Last Name Validation Unit Tests
    func testSignFormModelValidator_WhenValidLastNameProvided_ShouldReturnTrue() {
        // Given
        // When
        let isLastNameValid = sut.isLastNameValid(lastName: "Nguyen")
        
        // Then
        XCTAssertTrue(isLastNameValid, "The isLastNameValid() should have returned TRUE for a valid last name but returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortLastNameProvided_ShouldReturnFalse() {
        // Given
        // When
        let isLasteNameValid = sut.isLastNameValid(lastName: "N")
        
        // Then
        XCTAssertFalse(isLasteNameValid, "The isLastNameValid() should have returned FALSE for a last name that is shorter than \(SignupConstants.lastNameMinLength) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongLastNameProvided_ShouldReturnFalse() {
        // Given
        // When
        let isLastNameValid = sut.isLastNameValid(lastName: "OliverOliverOliver")
        // Then
        XCTAssertFalse(isLastNameValid, "The isLastNameValid() should have returned FALSE for a last name that is longer than \(SignupConstants.lastNameMaxLength) characters but it has returned TRUE")
    }
    
    // MARK: Email Address Validation
    func testSignupFormModelValidator_WhenValidEmailProvided_ShouldReturnTrue() {
        // Given
        // When
        let isValidEmailFormat = sut.isValidEmailFormat(email: "oliver@gmail.com")
        // Then
        XCTAssertTrue(isValidEmailFormat, "Provided valid email address format but validation did not pass")
    }
    
    func testSignupFormModelValidator_WhenInValidEmailProvided_ShouldReturnFalse() {
        // Given
        // When
        let isValidEmailFormat = sut.isValidEmailFormat(email: "test@test")
        // Then
        XCTAssertFalse(isValidEmailFormat, "Provided invalid email address format but validation still passed")
    }
    
    // MARK: Password Validation
    func testSignupFormModelValidator_WhenValidPasswordProvided_ShouldReturnTrue() {
        // Given
        // When
        let isPasswordValid = sut.isPasswordValid(password: "12345678")
        // Then
        XCTAssertTrue(isPasswordValid, "The isPasswordValid() should have returned TRUE for a valid password  but it has returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse() {
        // Given
        // When
        let isPasswordValid = sut.isPasswordValid(password: "12")
        // Then
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is shorter than \(SignupConstants.passwordMinLength) but it has returned TRUE")
        
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse() {
        
        // Act
        let isPasswordValid = sut.isPasswordValid(password: "12345678901234567")
        
        // Assert
        XCTAssertFalse(isPasswordValid, "The isPasswordValid() should have returned FALSE for a password that is longer than \(SignupConstants.passwordMaxLength) but it has returned TRUE")
        
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
