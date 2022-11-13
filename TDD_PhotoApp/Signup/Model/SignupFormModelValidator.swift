//
//  SignupFormModelValidator.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 12/11/2022.
//

import Foundation


class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool {
        var result = true
        
        if firstName.count < SignupConstants.firstNameMinLength || firstName.count > SignupConstants.firstNameMaxLength {
            result = false
        }
        
        return result
    }
    
    func doPasswordsMatch(password: String, repeatPassword: String) -> Bool {
        return password == repeatPassword
    }
}
