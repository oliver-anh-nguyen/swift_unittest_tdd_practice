//
//  SignupPresenterProtocol.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 14/11/2022.
//

import Foundation

protocol SignupPresenterProtocol: AnyObject {
    
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol)
    
    func processUserSignup(formModel: SignupFormModel)
}
