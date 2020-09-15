//
//  DemoAlertController.swift
//  AlertViewReleaseIssue
//
//  Created by Min on 2020/9/15.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

class DemoAlertController: UIViewController {

  lazy private var alertView: ReleaseIssueAlertView = {
    return ReleaseIssueAlertView(testAction: dismissDidAction)
  }()

  // MARK: - UIViewController

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupUserInterface()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print(#function)
  }

  deinit {
    print(String(describing: type(of: self.self)), " \(#function)")
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.25)
    view.addSubview(alertView)
    setupAutoLayout()
  }

  private func setupAutoLayout() {
    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-80-[alertView]-80-|",
      options: [],
      metrics: nil,
      views: ["alertView": alertView]))

    view.addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:|-120-[alertView(150)]",
      options: [],
      metrics: nil,
      views: ["alertView": alertView]))
  }

  // MARK: - Action Methods

  private func dismissDidAction() {
    dismiss(animated: true, completion: nil)
  }
}
