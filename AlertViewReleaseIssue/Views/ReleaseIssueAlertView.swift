//
//  ReleaseIssueAlertView.swift
//  AlertViewReleaseIssue
//
//  Created by Min on 2020/9/15.
//  Copyright © 2020 Min. All rights reserved.
//

import UIKit

class ReleaseIssueAlertView: UIView {

  lazy private var testButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = .systemPink
    button.setTitle("Dismiss", for: .normal)
    button.setTitleColor(.white, for: .normal)
    button.layer.cornerRadius = 10
    button.addTarget(self, action: #selector(testButtonDidPressed), for: .touchUpInside)
    return button
  }()

  // MARK: - Initialization

  let testAction: (() -> Void)?

  init(testAction: (() -> Void)? = nil) {
    self.testAction = testAction
    super.init(frame: .zero)
    setupUserInterface()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    print(String(describing: type(of: self.self)), " \(#function)")
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    layer.cornerRadius = 20
    backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 0.8)
    translatesAutoresizingMaskIntoConstraints = false
    addSubview(testButton)
    setupAutoLayout()
  }

  private func setupAutoLayout() {
    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "H:|-50-[testButton]-50-|",
      options: [],
      metrics: nil,
      views: ["testButton": testButton]))

    addConstraints(NSLayoutConstraint.constraints(
      withVisualFormat: "V:[testButton(40)]-30-|",
      options: [],
      metrics: nil,
      views: ["testButton": testButton]))
  }

  // MARK: - Action Methods

  @objc private func testButtonDidPressed() {
    testAction?()
  }
}
