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
        studyGroupTableView.register(headerFooterViewType: TwoButtonsTableViewHeaderView.self)
        studyGroupTableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
        
        invitationTableView.register(cellType: TitleTableViewCell.self)
        invitationTableView.register(headerFooterViewType: TwoButtonsTableViewHeaderView.self)
        invitationTableView.sectionHeaderHeight = CGFloat.leastNormalMagnitude
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
            let headerView = tableView.dequeueReusableHeaderFooterView(TwoButtonsTableViewHeaderView.self)
            headerView?.load(leadingLabelText: "Create A Group", trailingButtonTitle: "Leave All Groups")
            return headerView
        case invitationTableView:
            let headerView = tableView.dequeueReusableHeaderFooterView(TwoButtonsTableViewHeaderView.self)
            headerView?.load(leadingLabelText: "Pending Invitations", trailingButtonTitle: "Deny All Invites")
            return headerView
        default: return nil
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 30
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
    // MARK: - Cell Setup Helpers
    
    private func titleTableViewCell(in tableView: UITableView, for indexPath: IndexPath) -> TitleTableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: TitleTableViewCell.self)
        return cell
    }
}
