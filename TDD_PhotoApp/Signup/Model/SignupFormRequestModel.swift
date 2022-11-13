//
//  SignupFormRequestModel.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 12/11/2022.
//

import Foundation

struct SignupFormRequestModel : Encodable {
    let firstName: String
    let lastName: String
    let email: String
    let password: String
}
