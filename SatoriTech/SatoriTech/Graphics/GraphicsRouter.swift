//
//  GraphicsRouter.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation

class GraphicsRouter: GraphicsRouterProtocol {
    
    var view: GraphicsViewController
    var interactor: GraphicsInteractor
    var presenter: GraphicsPresenter
    
    init(){
        view = GraphicsViewController()
        interactor = GraphicsInteractor()
        presenter = GraphicsPresenter()
        view.presenter = self.presenter
        interactor.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
    }
}
