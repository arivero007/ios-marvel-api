//
//  UILocalizableLabel.swift
//  MarvelAPI
//
//  Created by AlexR on 4/10/21.
//

import UIKit

@IBDesignable
final class UIDesignableLabel: UILocalizableLabel {
}

class UILocalizableLabel: UILabel {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        text = text?.localized
    }
}

class UILocalizedTextField: UITextField {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        text = text?.localized
        placeholder = placeholder?.localized
    }
}
