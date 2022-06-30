//
//  ViewController.swift
//  StopWatch
//
//  Created by Gershy Lev on 6/22/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    var viewModel: StopWatchViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = StopWatchViewModel()
        timeLabel.text = viewModel.timeLabelText

        viewModel.startClosure = { [weak self] in
            self?.updateLabels()
        }
                
        viewModel.resetClosure = { [weak self] in
            self?.updateLabels()
        }
    }
    
    func updateLabels() {
        self.startButton.setTitle(self.viewModel.startButtonTitle, for: .normal)
        self.timeLabel.text = self.viewModel.timeLabelText
    }

    @IBAction func startButtonTapped(_ sender: UIButton) {
        viewModel.startTimer()
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        viewModel.resetTimer()
    }
}

