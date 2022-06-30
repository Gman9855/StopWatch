//
//  StopWatchViewModel.swift
//  StopWatch
//
//  Created by Gershy Lev on 6/22/22.
//

import Foundation

class StopWatchViewModel {
    public private(set) var timeLabelText: String!
    public private(set) var startButtonTitle: String!
    private var timer: Timer?
    public private(set) var time: Int = 0 {
        didSet {
            timeLabelText = "\(time)"
        }
    }
    var startClosure: (() -> Void)?
    var resetClosure: (() -> Void)?
    
    init() {
        timeLabelText = "0"
        startButtonTitle = "Start"
    }
    
    func startTimer() {
        handleTimerAction()
    }
    
    func pauseTimer() {
        handleTimerAction()
    }
    
    func continueTimer() {
        handleTimerAction()
    }
    
    func handleTimerAction() {
        if let timer = timer {
            startButtonTitle = timer.isValid ? "Continue" : "Start"
            timer.invalidate()
            self.timer = nil
            if let startClosure = startClosure {
                startClosure()
            }
        } else {
            timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                self.time += 1
                self.startButtonTitle = (timer.isValid ? "Pause" : "Start")
                if let startClosure = self.startClosure {
                    startClosure()
                }
            }
        }
    }
    
    func resetTimer() {
        timer?.invalidate()
        timer = nil
        time = 0
        startButtonTitle = "Start"
        if let resetClosure = self.resetClosure {
            resetClosure()
        }
    }
}

