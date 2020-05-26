//
//  ManageGroupsViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit

class ManageGroupsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var studyGroupTableView: UITableView!
    @IBOutlet weak var invitationTableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()

        view.backgroundColor = .blue
    }
}
