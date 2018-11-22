//
//  PickerTextField.swift
//  donation-tracker
//
//  Created by An Tran on 11/22/18.
//  Copyright © 2018 An Tran. All rights reserved.
//

import UIKit

class PickerTextField: UITextField {

    override func caretRect(for position: UITextPosition) -> CGRect {
        return .zero
    }
    
    override func canPerformAction(_ action: Selector, withSender sender: Any?) -> Bool {
        return false
    }
    
}
