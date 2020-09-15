//
//  ViewController.swift
//  AlertViewReleaseIssue
//
//  Created by Min on 2020/9/15.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
  }

  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    super.touchesBegan(touches, with: event)
    let alertVC = DemoAlertController()
    alertVC.modalPresentationStyle = .overFullScreen
    alertVC.modalTransitionStyle = .crossDissolve
    present(alertVC, animated: true, completion: nil)
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .white
  }
}

