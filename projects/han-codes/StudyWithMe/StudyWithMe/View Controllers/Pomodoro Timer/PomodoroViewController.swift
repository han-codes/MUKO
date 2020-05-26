//
//  PomodoroViewController.swift
//  StudyWithMe
//
//  Created by Hannie Kim on 5/25/20.
//  Copyright © 2020 Hannie Kim. All rights reserved.
//

import UIKit

class PomodoroViewController: UIViewController {

    enum IntervalType {
        
        case study
        case rest
        case longRest
    }
    
    // MARK: - Outlets
        
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var studyGroupButton: UIButton!
    @IBOutlet weak var timerLabel: UILabel!
    
    // MARK: - Properties
    
    let intervals: [IntervalType] = [.study, .rest, .study, .rest, .study, .rest, .study, .longRest]
    var currentInterval = 0
    var breakEnabled = false
    var seconds = 0
    var timer = Timer()
    var isTimerRunning = false
    var isPaused = true
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setUpButtons()
        setUpTimer()
    }
    
    private func setUpButtons() {
                
        // TODO: If not joined a group, "Create a Group"
        // TODO: If joined group, "Leave Study Group"
    }
    
    private func setUpTimer() {
        
        if currentInterval > intervals.count {
            
            currentInterval = 0
        }
        
        switch intervals[currentInterval] {
            
//        case .study: seconds = 1500
//        case .rest: seconds = 300
//        case .longRest: seconds = 1200
            case .study: seconds = 3
            case .rest: seconds = 5
            case .longRest: seconds = 8
        }
        
        timerLabel.text = timeString(timeInterval: TimeInterval(seconds))
    }
    
    private func runTimer() {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(PomodoroViewController.updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc private func updateTimer() {
        
        if seconds < 1 {
            
            timer.invalidate()
            
            // TODO: Instead of alert, display a label
            let timeIsUpAlert = UIAlertController(withTitle: "Yo Scott!", message: "Time is up!") {
                self.currentInterval += 1
                self.setUpTimer()
                self.isPaused = true
                self.timerLabel.text = self.timeString(timeInterval: TimeInterval(self.seconds))
            }
            present(timeIsUpAlert, animated: true, completion: nil)
        }
        else {
         
            seconds -= 1
            timerLabel.text = timeString(timeInterval: TimeInterval(seconds))
        }
    }
    
    private func timeString(timeInterval: TimeInterval) -> String {
        
        let minutes = Int(timeInterval) / 60 % 60
        let seconds = Int(timeInterval) % 60
        
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
    // MARK: - Actions
    
    @IBAction func playPausePressed(_ sender: Any) {
                
        isPaused ? runTimer() : timer.invalidate()
        
        isPaused = !isPaused
    }
    
    @IBAction func sendInvitesButtonPressed(_ sender: Any) {
        
    }
    
    @IBAction func studyGroupButtonPressed(_ sender: Any) {
        
        // If user is in a group then show Leave Study Group
        // If user is not in a group then create a group when pressed
    }
}
