//
//  MockSignupPresenter.swift
//  TDD_PhotoAppTests
//
//  Created by AnhNguyen on 14/11/2022.
//

import Foundation
@testable import TDD_PhotoApp

class MockSignupPresenter: SignupPresenterProtocol {
    
    var processUserSignupCalled: Bool = false
    
    required init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        
    }
    
    func processUserSignup(formModel: SignupFormModel) {
        processUserSignupCalled = true
    }
}
