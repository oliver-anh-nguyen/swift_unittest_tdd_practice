//
//  SignupWebServiceProtocol.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 13/11/2022.
//

import Foundation

protocol SignupWebServiceProtocol {
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupError?) -> Void)
}
