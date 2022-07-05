//
//  KeyboardInfo.swift
//  ClearKeyboardHandler
//
//  Created by David Seca on 27.06.22.
//

import UIKit

/// Frame and animation data extracted from a keyboard show/hide notification
public struct KeyboardInfo {

    /// Frame of the keyboard in screen coordinates before animating the keyboard.
    public let beginFrame: CGRect

    /// Frame of the keyboard in screen coordinates after animating the keyboard.
    public let endFrame: CGRect

    /// Duration of Keyboard hide / show duration
    public let animationDuration: TimeInterval

    /// Constructor given a registered notification
    ///  - parameters:
    ///     - notification: notification to take info from
    init? (notification: Notification) {
        guard let userInfo = (notification as NSNotification).userInfo,
              let beginFrameValue = userInfo[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue,
              let endFrameValue = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue,
              let animationDuration = userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else {
            return nil
        }

        self.beginFrame = beginFrameValue.cgRectValue
        self.endFrame = endFrameValue.cgRectValue
        self.animationDuration = animationDuration
    }

    /// Keyboard height
    public var keyboardHeight: CGFloat {
        return self.endFrame.height
    }

}
