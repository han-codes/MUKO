//
//  LoginViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/22/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import FirebaseAuth

protocol LogInDelegate: class {
    
    func loggedIn()
}

class LoginViewController: BaseXibViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var emailAddressTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var invalidCredentialsLabel: UILabel!
    
    // MARK: - Properties
    
    let authenticationContainerViewController: AuthenticationContainerViewController
    var emailAddress: String?
    var password: String?
    weak var delegate: LogInDelegate?
    
    // MARK: - Initialization
    
    init(authenticationContainerViewController: AuthenticationContainerViewController) {
        
        self.authenticationContainerViewController = authenticationContainerViewController
        delegate = authenticationContainerViewController
        
        super.init()
        
        self.authenticationContainerViewController.buttonDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpUI()
    }
    
    // MARK: - Setup
    
    private func setUpUI() {
        
        setUpInvalidCredentialsLabel()
        setUpTextFields()
    }
    
    private func setUpInvalidCredentialsLabel() {
        
        invalidCredentialsLabel.isHidden = true
        invalidCredentialsLabel.text = Constants.Authentication.Login.Error.invalidCredsText
    }
    
    private func setUpTextFields() {
        
        emailAddressTextField.delegate = self
        passwordTextField.delegate = self
    }
}

// MARK: - UITextFieldDelegate

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        switch textField {
            
        case emailAddressTextField:
            emailAddress = textField.text
        case passwordTextField:
            password = textField.text
        default:
            break
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        view.endEditing(true)
        return true
    }
}


// MARK: - AuthenticationButtonDelegate Callback

extension LoginViewController: AuthenticationButtonDelegate {
    
    func authenticationButtonPressed() {
        
        guard let email = emailAddress, let password = password else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
            guard let strongSelf = self else { return }
            
            if let error = error {
                
                let errorAlertController = UIAlertController(withTitle: "Error", message: error.localizedDescription)
                strongSelf.present(errorAlertController, animated: true, completion: nil)
            }
                        
            UserSessionManager.userID = email
            strongSelf.delegate?.loggedIn()
        }
    }
}
