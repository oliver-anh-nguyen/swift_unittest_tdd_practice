//
//  SignupPresenter.swift
//  TDD_PhotoApp
//
//  Created by AnhNguyen on 13/11/2022.
//

class SignupPresenter {
    
    private var formModelValidator: SignupModelValidatorProtocol
    private var webservice: SignupWebServiceProtocol
    private weak var delegate: SignupViewDelegateProtocol?
    
    init(formModelValidator: SignupModelValidatorProtocol, webservice: SignupWebServiceProtocol, delegate: SignupViewDelegateProtocol) {
        self.formModelValidator = formModelValidator
        self.webservice = webservice
        self.delegate = delegate
    }
 
    func processUserSignup(formModel: SignupFormModel) {
        if !self.formModelValidator.isFirstNameValid(firstName: formModel.firstName) {
            return 
        }
        
        if !self.formModelValidator.isLastNameValid(lastName: formModel.lastName) {
            return
        }
        
        if !formModelValidator.isValidEmailFormat(email: formModel.email) {
            return
        }
        
        if !formModelValidator.isPasswordValid(password: formModel.password) {
            return
        }
        
        if !formModelValidator.doPasswordsMatch(password: formModel.password, repeatPassword: formModel.repeatPassword) {
            return
        }
        
        let requestModel = SignupFormRequestModel(firstName: formModel.firstName, lastName: formModel.lastName, email: formModel.email, password: formModel.password)
        webservice.signup(withForm: requestModel) {  [weak self] response, error in
            if let error = error {
                self?.delegate?.errorHandler(error: error)
                return
            }
            
            if let _ = response {
                self?.delegate?.successfullSignup()
            }
        }
    }
}
