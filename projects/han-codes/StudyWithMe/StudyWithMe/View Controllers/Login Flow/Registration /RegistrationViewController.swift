//
//  RegistrationViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/24/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegistrationViewController: BaseXibViewController, AuthenticationButtonDelegate {

    // MARK: - Outlets
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    // MARK: - Properties
    
    var authenticationContainerViewController: AuthenticationContainerViewController
    var emailAddress: String?
    var password: String?
    var confirmationPassword: String?
    
    // MARK: - Initializer
    
    init(authenticationContainerViewController: AuthenticationContainerViewController) {
        
        self.authenticationContainerViewController = authenticationContainerViewController
        
        super.init()
        
        self.authenticationContainerViewController.buttonDelegate = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpLabels()
    }
    
    private func setUpLabels() {
        
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
        confirmPasswordTextField.delegate = self
        
        passwordTextField.isSecureTextEntry = true
        confirmPasswordTextField.isSecureTextEntry = true
    }
    
    // MARK: - Actions
    
    func authenticationButtonPressed() {
        
        guard let emailAddress = emailAddress, let password = confirmationPassword else {
            // TODO: Text field validation to let user know they have not entered correct values
            return
        }
        
        Auth.auth().createUser(withEmail: emailAddress, password: password) { authResult, error in
            
            if let error = error {
            
                let errorAlertController = UIAlertController(withTitle: "Error", message: error.localizedDescription)
                self.present(errorAlertController, animated: true, completion: nil)
            }
            
            UserSessionManager.userID = emailAddress
            
            let successAlertController = UIAlertController(withTitle: "Success!", message: "Successfully registered with \(emailAddress)") {
                self.authenticationContainerViewController.currentState = .login
            }
            
            self.present(successAlertController, animated: true, completion: nil)
        }
    }
}

extension RegistrationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
            
        case emailAddressTextField:
            emailAddress = textField.text
        case passwordTextField:
            password = textField.text
        case confirmPasswordTextField:
            confirmationPassword = textField.text
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return true
    }
}
