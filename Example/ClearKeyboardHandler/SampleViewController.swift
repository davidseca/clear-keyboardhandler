//
//  SampleViewController.swift
//  ClearKeyboardHandler
//
//  Created by David Seca on 27.06.22.
//  Copyright (c) 2022 David Seca. All rights reserved.
//

import UIKit
import ClearKeyboardHandler

class SampleViewController: UIViewController {

    /// Text field to play with constraints
    let textField = UITextField()

    /// Textfield bottom offset
    let bottomOffset: CGFloat = 8

    /// Textfield bottom margin
    var bottomMargin: NSLayoutConstraint?

    /// Button for hidding Keyboard
    let closeButton = UIButton(type: .system)

    /// just KeyboardHandler
    private var keyboardHandler: KeyboardHandler?

    override func viewDidLoad() {
        super.viewDidLoad()

        // config ui items
        self.textField.borderStyle = .line
        self.closeButton.setTitle("Hide Keyboard", for: .normal)
        self.closeButton.isHidden = true
        self.closeButton.addTarget(self, action: #selector(self.closeButtonTapped), for: .touchUpInside)

        // add subviews
        self.view.addSubview(self.textField)
        self.view.addSubview(self.closeButton)

        // config constraints
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.closeButton.translatesAutoresizingMaskIntoConstraints = false

        let bottomConstraint = self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: bottomOffset)
        self.bottomMargin = bottomConstraint
        let safeArea = self.view.safeAreaLayoutGuide
        self.view.addConstraints([
            self.textField.heightAnchor.constraint(equalToConstant: 34),
            self.textField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor),
            self.textField.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor),
            bottomConstraint,
            self.closeButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor),
            self.closeButton.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 60)
        ])

        // connect keyboardHandler
        self.keyboardHandler = KeyboardHandler(handler: self)
    }

}

// MARK: - closeButton Handler
extension SampleViewController {

    @objc func closeButtonTapped() {
        self.textField.resignFirstResponder()
    }

}

// MARK: - KeyboardHandlerDelegate
extension SampleViewController: KeyboardHandlerDelegate {

    func keyboardWillShow(keyboardInfo: KeyboardInfo) {
        guard self.view.window != nil else {
            return
        }

        self.bottomMargin?.constant = keyboardInfo.keyboardHeight + bottomOffset

        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
            self.closeButton.isHidden = false
        }
    }

    func keyboardWillHide(keyboardInfo: KeyboardInfo) {
        guard self.view.window != nil else {
            return
        }

        self.bottomMargin?.constant = bottomOffset

        UIView.animate(withDuration: keyboardInfo.animationDuration) {
            self.view.layoutIfNeeded()
            self.closeButton.isHidden = true
        }
    }

}
