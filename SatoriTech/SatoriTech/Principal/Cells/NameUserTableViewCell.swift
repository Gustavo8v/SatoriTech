//
//  NameUserTableViewCell.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//
protocol NameUserTableViewCellDelegate: AnyObject {
    func getName(name: String)
    func hiddeKeyboard()
}

import UIKit

class NameUserTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var nameTextField: UITextField!
    weak var delegate: NameUserTableViewCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        nameTextField.delegate = self
        nameTextField.keyboardType = .alphabet
    }

    func clearTextField(){
        nameTextField.text = nil
    }
}

extension NameUserTableViewCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let safeText = textField.text else { return }
        delegate?.getName(name: safeText)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        delegate?.hiddeKeyboard()
        return false
    }
}
