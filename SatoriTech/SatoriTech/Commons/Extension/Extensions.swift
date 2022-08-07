//
//  Extensions.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import UIKit

protocol ReuseIdentifier {
    
}

extension ReuseIdentifier where Self: Any {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension UIView: ReuseIdentifier {
    
}

extension UIViewController {
    
    func showLoader(){
        let backGround = UIViewController()
        let loader = UIActivityIndicatorView()
        let message = UILabel()
        message.numberOfLines = 0
        backGround.view.backgroundColor = .black.withAlphaComponent(0.5)
        loader.color = .white
        loader.startAnimating()
        message.text = "Espere un momento, estamos subiendo la información"
        message.textColor = .lightGray
        message.textAlignment = .center
        loader.translatesAutoresizingMaskIntoConstraints = false
        message.translatesAutoresizingMaskIntoConstraints = false
        backGround.view.addSubview(loader)
        backGround.view.addSubview(message)
        NSLayoutConstraint.activate([
            loader.centerXAnchor.constraint(equalTo: backGround.view.centerXAnchor),
            loader.centerYAnchor.constraint(equalTo: backGround.view.centerYAnchor),
            loader.heightAnchor.constraint(equalToConstant: 50),
            loader.widthAnchor.constraint(equalToConstant: 50),
            message.topAnchor.constraint(equalTo: loader.bottomAnchor, constant: 15),
            message.centerXAnchor.constraint(equalTo: backGround.view.centerXAnchor),
            message.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.90)
        ])
        backGround.modalPresentationStyle = .overFullScreen
        self.present(backGround, animated: true)
    }
    
    func hiddeLoader(completion: @escaping() -> Void){
        dismiss(animated: true) {
            completion()
        }
    }
    
    func showAlert(message: String, title: String){
        let alert = UIAlertController(title: message, message: title, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel)
        alert.addAction(action)
        self.present(alert, animated: true)
    }
}

extension UIColor {
    func colorFromHex(_ hex: String) -> UIColor {
        var hexString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }
        
        if hexString.count != 6 {
            return UIColor.black
        }
        
        var rgb : UInt32 = 0
        Scanner(string: hexString).scanHexInt32(&rgb)
        return UIColor.init(red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
                            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
                            blue: CGFloat(rgb & 0x0000FF) / 255.0,
                            alpha: 1.0)
    }
}
