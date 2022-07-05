//
//  KeyboardHandlerDelegate.swift
//  ClearKeyboardHandler
//
//  Created by David Seca on 27.06.22.
//

import Foundation

/// Keyboard Handler protocol
public protocol KeyboardHandlerDelegate: AnyObject {

    /// Fired when Keyboard will be shown
    /// - parameters:
    ///    - keyboardInfo: Keyboard Info
    func keyboardWillShow(keyboardInfo: KeyboardInfo)

    /// Fired when Keyboard will be hidden
    /// - parameters:
    ///    - keyboardInfo: Keyboard Info
    func keyboardWillHide(keyboardInfo: KeyboardInfo)

}
