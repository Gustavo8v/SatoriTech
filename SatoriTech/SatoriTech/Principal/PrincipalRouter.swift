//
//  PrincipalRouter.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import UIKit

class PrincipalRouter: PrincipalRouterProtocol {
    
    var view: PrincipalViewController
    var interactor: PrincipalInteractor
    var presenter: PrincipalPresenter
    
    init(){
        view = PrincipalViewController()
        interactor = PrincipalInteractor()
        presenter = PrincipalPresenter()
        view.presenter = self.presenter
        interactor.presenter = self.presenter
        presenter.view = self.view
        presenter.interactor = self.interactor
        presenter.router = self
    }
    
    func goToCharts() {
        let vc = GraphicsRouter().view
        vc.modalPresentationStyle = .overFullScreen
        view.navigationController?.pushViewController(vc, animated: true)
    }
    
    func presentPickerCamera(picker: UIImagePickerController) {
        picker.delegate = view.self
        view.present(picker, animated: true)
    }
    
    func showAlertCamera(alert: UIAlertController) {
        view.present(alert, animated: true)
    }
    
    func goToSeeImage(image: UIImage) {
        guard let vc = SeeImageRouter(image: image).view else { return }
        view.present(vc, animated: true)
    }
}
