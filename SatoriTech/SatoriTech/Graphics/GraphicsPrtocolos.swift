//
//  GraphicsPrtocolos.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation

protocol GraphicsViewProtocol: AnyObject {
    var presenter: GraphicsPresenterProtocol? { get set }
    
    func setDataStore(data: GraphicsEntity, colors: [String])
    func setTable()
}

protocol GraphicsInteractorProtocol: AnyObject {
    var presenter: GraphicsPresenterProtocol? { get set }
    
    func getDataStores()
}

protocol GraphicsPresenterProtocol: AnyObject {
    var view: GraphicsViewProtocol? { get set }
    var interactor: GraphicsInteractorProtocol? { get set }
    var router: GraphicsRouterProtocol? { get set }
    
    func viewDidLoad()
    func bringDataStore(data: GraphicsEntity, colors: [String:Any])
}

protocol GraphicsRouterProtocol: AnyObject {
    var view: GraphicsViewController { get set }
    var interactor: GraphicsInteractor { get set }
    var presenter: GraphicsPresenter { get set }
}
