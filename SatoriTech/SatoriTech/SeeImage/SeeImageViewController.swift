//
//  SeeImageViewController.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 07/08/22.
//

import UIKit

class SeeImageViewController: UIViewController {
    
    var image: UIImage?
    
    @IBOutlet private weak var imageUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageUser.image = image
    }
}
