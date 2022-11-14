//
//  SignupViewDelegateProtocol.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 13/11/2022.
//

import Foundation

protocol SignupViewDelegateProtocol: AnyObject {
    func successfullSignup()
    func errorHandler(error: SignupError)
}
