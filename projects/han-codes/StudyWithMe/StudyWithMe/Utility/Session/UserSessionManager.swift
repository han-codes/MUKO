//
//  UserSessionManager.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation
import KeychainAccess

typealias UserID = String

class UserSessionManager {
 
    static var userID: UserID? {
        
        get {
            return keychain[Keys.userID]
        }
        set {
            keychain[Keys.userID] = newValue
        }
    }
}

// MARK: - Keychain Properties

private let keychain = Keychain(service: "com.econocheck.eclub-service")

private struct Keys {
    
    static let userID = "ID"
}
