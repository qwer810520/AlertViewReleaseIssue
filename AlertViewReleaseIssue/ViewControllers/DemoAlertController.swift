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
    return ReleaseIssueAlertView(testAction: { [weak self] in self?.dismissDidAction()})
  }()

  // MARK: - UIViewController

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    print(#function, "retainCoun: \(CFGetRetainCount(self))")
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    super.loadView()
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
    setupUserInterface()
  }

  override func viewDidDisappear(_ animated: Bool) {
    super.viewDidDisappear(animated)
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
  }

  deinit {
    print(String(describing: type(of: self.self)), " \(#function)")
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
  }

  // MARK: - Private Methods

  private func setupUserInterface() {
    view.backgroundColor = .init(red: 0, green: 0, blue: 0, alpha: 0.25)
    view.addSubview(alertView)
    setupAutoLayout()
    print(#function, "retainCoun: , \(CFGetRetainCount(self))")
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
