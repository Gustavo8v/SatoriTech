//
//  SeeImageRouter.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 07/08/22.
//

import Foundation
import UIKit

class SeeImageRouter {
    
    var view: SeeImageViewController?
    
    init(image: UIImage){
        view = SeeImageViewController()
        view?.image = image
    }
}
