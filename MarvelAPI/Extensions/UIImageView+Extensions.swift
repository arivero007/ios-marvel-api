//
//  UIImageView+Extensions.swift
//  MarvelAPI
//
//  Created by AlexR on 4/10/21.
//

import Foundation
import UIKit

// Loads image on UIImageView from url
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
