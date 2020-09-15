//
//  ViewController.swift
//  AlertViewReleaseIssue
//
//  Created by Min on 2020/9/15.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  lazy private var presentButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Present", for: .normal)
    button.backgroundColor = .systemOrange
    button.layer.cornerRadius = 10
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(presentButtonDidPressed), for: .touchUpInside)
    return button
  }()

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .white
    view.addSubview(presentButton)
    setupAutoLayout()
  }

  private func setupAutoLayout() {
    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-50-[presentButton]-50-|",
      options: [],
      metrics: nil,
      views: ["presentButton": presentButton]))

    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:[presentButton(60)]-120-|",
      options: [],
      metrics: nil,
      views: ["presentButton": presentButton]))
  }

  // MARK: - Action Methods

  @objc private func presentButtonDidPressed() {
    let alertVC = DemoAlertController()
    print(#function, "retainCoun: , \(CFGetRetainCount(alertVC))")
    alertVC.modalPresentationStyle = .overFullScreen
    alertVC.modalTransitionStyle = .crossDissolve
    present(alertVC, animated: true, completion: nil)
  }
}

