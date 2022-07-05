//
//  KeyboardHandler.swift
//  ClearKeyboardHandler
//
//  Created by David Seca on 27.06.22.
//

import UIKit

/// Class to centralise Keyboard observation
public class KeyboardHandler: NSObject {

    /// KeyboardHandler delegate
    private weak var handler: KeyboardHandlerDelegate?

    /// Constructor
    ///  - parameters:
    ///     - handler: KeyboardHandler delegate
    public required init(handler: KeyboardHandlerDelegate) {
        self.handler = handler
        super.init()

        let nc = NotificationCenter.default
        nc.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        nc.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    /// Destructor
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    /// UIResponder.keyboardWillShowNotification handler
    @objc func keyboardWillShow(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(notification: notification) else {
            return
        }

        self.handler?.keyboardWillShow(keyboardInfo: keyboardInfo)
    }

    /// UIResponder.keyboardWillHideNotification handler
    @objc func keyboardWillHide(_ notification: Notification) {
        guard let keyboardInfo = KeyboardInfo(notification: notification) else {
            return
        }

        self.handler?.keyboardWillHide(keyboardInfo: keyboardInfo)
    }

}
