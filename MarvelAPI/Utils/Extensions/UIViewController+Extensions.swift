//
//  UIViewController+Extensions.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import UIKit


extension UIViewController{
    
    ///  Mostrar un error mediante alerta al usuario con la opción de aceptar nada más
    ///
    /// - Parameters:
    ///   - mensaje: texto a mostrar en la alerta
    ///   - accepted: optional closure -> sent if pressed accept
    func showError(_ mensaje: String? = "unknown-error".localized, accepted: (() -> Void)? = nil) {
        let alertController = UIAlertController(title: "error-occurred".localized, message: mensaje, preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "accept".localized, style: .default) { (_) in
            accepted?()
        }
        alertController.addAction(aceptar)
        self.present(alertController, animated: true, completion: nil)
    }
    
}
