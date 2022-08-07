//
//  PrincipalProtocols.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import UIKit

protocol PrincipalViewProtocol: AnyObject {
    var presenter: PrincipalPresenterProtocol? { get set }
    
    func configureTable()
    func configureUI()
    func enableButton(enable: Bool, color: UIColor)
    func succesUpload()
    func errorUpload()
}

protocol PrincipalInteractorProtocol: AnyObject {
    var presenter: PrincipalPresenterProtocol? { get set }
    
    func uploadImageFirebaseStore(photo: ModelPhoto)
}

protocol PrincipalPresenterProtocol: AnyObject {
    var view: PrincipalViewProtocol? { get set }
    var interactor: PrincipalInteractorProtocol? { get set }
    var router: PrincipalRouterProtocol? { get set }
    
    func viewDidLoad()
    func goToCharts()
    func openFinderPhoto()
    func uploadPhoto(photo: ModelPhoto)
    func validateSendInfo(info: ModelPhoto?)
    func responseUploadPhoto(success: Bool)
    func seeAllImage(image: UIImage?)
}

protocol PrincipalRouterProtocol: AnyObject {
    var view: PrincipalViewController { get set }
    var interactor: PrincipalInteractor { get set }
    var presenter: PrincipalPresenter { get set }
    
    func goToCharts()
    func presentPickerCamera(picker: UIImagePickerController)
    func showAlertCamera(alert: UIAlertController)
    func goToSeeImage(image: UIImage)
}
