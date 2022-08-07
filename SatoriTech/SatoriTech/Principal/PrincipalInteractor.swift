//
//  PrincipalInteractor.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import FirebaseStorage

class PrincipalInteractor: PrincipalInteractorProtocol {
    
    var presenter: PrincipalPresenterProtocol?
    private let storage = Storage.storage().reference()
    
    func uploadImageFirebaseStore(photo: ModelPhoto) {
        guard let dataImage = photo.dataImage,
              let safeName:String = photo.name else { return }
        storage.child("images/\(safeName)").putData(dataImage,
                                                    metadata: nil,
                                                    completion: { response, error in
            if error != nil {
                self.presenter?.responseUploadPhoto(success: false)
            } else {
                self.presenter?.responseUploadPhoto(success: true)
            }
        })
    }
}
