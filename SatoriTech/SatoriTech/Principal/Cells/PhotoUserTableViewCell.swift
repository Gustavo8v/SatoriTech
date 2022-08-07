//
//  PhotoUserTableViewCell.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//
protocol PhotoUserTableViewCellDelegate: AnyObject {
    func goToSeeImage()
}

import UIKit

class PhotoUserTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var userImage: UIImageView!
    
    weak var delegate: PhotoUserTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        userImage.layer.cornerRadius = 8
        userImage.isUserInteractionEnabled = true
        userImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(seeImage)))
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureImage(image: UIImage?){
        userImage.image = image == nil ? UIImage(systemName: "person.fill") : image
    }
    
    @objc func seeImage() {
        delegate?.goToSeeImage()
    }
}
