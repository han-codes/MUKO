//
//  UserDefaults+Convenience.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/22/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import Foundation

extension UserDefaults {
    
    static var hasLoggedIn: Bool {
        get {
            return standard.bool(forKey: Constants.UserDefaults.hasLoggedIn)
        }
        set {
            standard.set(newValue, forKey: Constants.UserDefaults.hasLoggedIn)
        }
    }
}
