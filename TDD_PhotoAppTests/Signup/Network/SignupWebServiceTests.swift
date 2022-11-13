//
//  SignupWebServiceTests.swift
//  TDD_PhotoAppTests
//
//  Created by AnhNguyen on 12/11/2022.
//

import XCTest
@testable import TDD_PhotoApp

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!
    var signFormRequestModel: SignupFormRequestModel!
    
    override func setUp() {
        
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        
        sut = SignupWebService(urlString: SignupConstants.signupURLString, urlSession: urlSession)
        
        signFormRequestModel = SignupFormRequestModel(firstName: "Oliver", lastName:"Nguyen", email:"oliver@gmail.com", password:"123")
    }
    
    override func tearDown() {
        sut = nil
        signFormRequestModel = nil
        MockURLProtocol.stubResponseData = nil
    }

    func testSignupWebService_WhenGivenSuccessfullResponse_ReturnSuccess() {
        // Given
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        
        // When
        sut.signup(withForm: signFormRequestModel) { response, error in
            
            // Then
            XCTAssertEqual(response?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace() {
        // Given
        let jsonString = "{\"path\":\"/users\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // When
        sut.signup(withForm: signFormRequestModel) { response, error in
            
            // Then
            XCTAssertNil(response, "The response model for a request containing unknow JSON response, should have been nil")
            XCTAssertEqual(error, SignupError.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebservice_WhenEmptyURLStringProvided_ReturnsError() {
        // Given
        sut = SignupWebService(urlString: "")
        let expectation = self.expectation(description: "An empty request URL string expectation")
        
        // When
        sut.signup(withForm: signFormRequestModel) { response, error in
            // Then
            XCTAssertNil(response, "When an invalidRequestURLString takes place, the response model must be nil")
            XCTAssertEqual(error, SignupError.invalidRequestURLString, "The signup() method did not return an expected error for an invalidRequestURLStringError error")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription() {
        
        // Given
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = SignupError.failedRequest(description:errorDescription)
        
        // When
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Then
            XCTAssertEqual(error, SignupError.failedRequest(description:errorDescription), "The signup() method did not return an expecter error for the Failed Request")
            XCTAssertEqual(error?.localizedDescription, errorDescription)
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
        
    }
}
