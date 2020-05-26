//
//  ManageGroupsViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit
import CocoaLumberjack

class ManageGroupsViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var studyGroupTableView: UITableView!
    @IBOutlet weak var invitationTableView: UITableView!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpTableView()
    }
    
    private func setUpTableView() {
        
        studyGroupTableView.delegate = self
        invitationTableView.delegate = self
        
        studyGroupTableView.dataSource = self
        invitationTableView.dataSource = self
        
        studyGroupTableView.register(cellType: TitleTableViewCell.self)
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource

extension ManageGroupsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TitleTableViewCell.self)
        cell.load(string: "Hi Test")
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        switch tableView {
            
        case studyGroupTableView:
            // TODO: Reusable header with 2 buttons
            DDLogWarn("Add reusable header")
        case invitationTableView:
            // TODO: Reusable header with 2 buttons
            DDLogWarn("Add reusable header")
        default: return nil
        }
        
        return nil
    }
    
    // MARK: - Cell Setup Helpers
    
    private func titleTableViewCell(in tableView: UITableView, for indexPath: IndexPath) -> TitleTableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TitleTableViewCell.self)
        return cell
    }
}
