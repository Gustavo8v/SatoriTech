//
//  GraphicsPresenter.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import UIKit

class GraphicsPresenter: GraphicsPresenterProtocol {
    
    var view: GraphicsViewProtocol?
    var interactor: GraphicsInteractorProtocol?
    var router: GraphicsRouterProtocol?
    
    func viewDidLoad() {
        interactor?.getDataStores()
        view?.setTable()
    }
    
    func bringDataStore(data: GraphicsEntity, colors: [String:Any]) {
        var colorsArray: [String] = []
        colors.forEach { color in
            guard let colorString:String = color.value as? String else { return }
            colorsArray.append(colorString)
        }
        view?.setDataStore(data: data, colors: colorsArray)
    }
}
