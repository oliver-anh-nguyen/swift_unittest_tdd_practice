//
//  MockSignupWebService.swift
//  TDD_PhotoAppTests
//
//  Created by AnhNguyen on 13/11/2022.
//

import Foundation
@testable import TDD_PhotoApp

class MockSignupWebService: SignupWebServiceProtocol {
    
    var isSignupMethodCalled: Bool = false
    
    var shouldReturnError: Bool = false
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping (SignupResponseModel?, SignupError?) -> Void) {
        isSignupMethodCalled = true
        
        if shouldReturnError {
            completionHandler(nil, SignupError.failedRequest(description: "Signup request was not successful"))
        } else {
            let responseModel = SignupResponseModel(status: "ok")
            completionHandler(responseModel, nil)
        }
        
    }
    
}
