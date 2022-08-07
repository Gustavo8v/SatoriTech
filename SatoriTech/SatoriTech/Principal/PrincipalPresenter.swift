//
//  PrincipalPresenter.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import UIKit

class PrincipalPresenter: PrincipalPresenterProtocol {
    
    var view: PrincipalViewProtocol?
    var interactor: PrincipalInteractorProtocol?
    var router: PrincipalRouterProtocol?
    
    func viewDidLoad() {
        view?.configureTable()
        view?.configureUI()
    }
    
    func goToCharts() {
        router?.goToCharts()
    }
    
    func openFinderPhoto() {
        let picker = UIImagePickerController()
        let alertPhoto = UIAlertController(title: "", message: "Seleccione una opción", preferredStyle: .actionSheet)
        let photoLibrary = UIAlertAction(title: "Galería", style: .default) { _ in
            picker.sourceType = .photoLibrary
            self.router?.presentPickerCamera(picker: picker)
        }
        let camera = UIAlertAction(title: "Cámara", style: .default) { _ in
            picker.sourceType = .camera
            self.router?.presentPickerCamera(picker: picker)
        }
        alertPhoto.addAction(photoLibrary)
        alertPhoto.addAction(camera)
        router?.showAlertCamera(alert: alertPhoto)
    }
    
    func uploadPhoto(photo: ModelPhoto) {
        guard let dataImage = photo.photo?.pngData() else { return }
        let safePhoto = ModelPhoto(photo: photo.photo,
                                   name: photo.name,
                                   dataImage: dataImage)
        interactor?.uploadImageFirebaseStore(photo: safePhoto)
    }
    
    func validateSendInfo(info: ModelPhoto?) {
        let validate = (info?.photo != nil && info?.name != nil && info?.name != "")
        view?.enableButton(enable: validate, color: validate ? .systemBlue : .lightGray)
    }
    
    func responseUploadPhoto(success: Bool) {
        if success {
            view?.succesUpload()
        } else {
            view?.errorUpload()
        }
    }
    
    func seeAllImage(image: UIImage?) {
        guard let image = image else {
            return
        }
        router?.goToSeeImage(image: image)
    }
}
