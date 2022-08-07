//
//  PrincipalViewController.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import UIKit
import FirebaseDatabase

class PrincipalViewController: UIViewController {
    
    @IBOutlet private weak var principalTable: UITableView!
    @IBOutlet private weak var uploadPhoto: UIButton!
    
    var presenter: PrincipalPresenterProtocol?
    var takeImage: UIImage?
    var nameUser: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
    @IBAction func onClickUploadPhotoFirebase(_ sender: Any) {
        showLoader()
        presenter?.uploadPhoto(photo: ModelPhoto(photo: takeImage, name: nameUser))
    }
}

extension PrincipalViewController: PrincipalViewProtocol {
    func configureTable() {
        principalTable.delegate = self
        principalTable.dataSource = self
        principalTable.register(UINib(nibName: NameUserTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: NameUserTableViewCell.reuseIdentifier)
        principalTable.register(UINib(nibName: PhotoUserTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: PhotoUserTableViewCell.reuseIdentifier)
        principalTable.register(UINib(nibName: ChartsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: ChartsTableViewCell.reuseIdentifier)
    }
    
    func configureUI() {
        uploadPhoto.isEnabled = false
        uploadPhoto.layer.cornerRadius = 12
    }
    
    func enableButton(enable: Bool, color: UIColor) {
        uploadPhoto.isEnabled = enable
        uploadPhoto.backgroundColor = color
    }
    
    func succesUpload() {
        hiddeLoader { [self] in
            takeImage = nil
            nameUser = nil
            principalTable.reloadData()
            self.showAlert(message: "Exito", title: "La foto se ha subido")
        }
    }
    
    func errorUpload() {
        hiddeLoader {
            self.showAlert(message: "Algo salió mal", title: "Hubo un error al subir la imagen")
        }
    }
}

extension PrincipalViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        switch indexPath.row {
        case 0:
            guard let nameCell = tableView.dequeueReusableCell(withIdentifier: NameUserTableViewCell.reuseIdentifier, for: indexPath) as? NameUserTableViewCell else { return cell }
            nameCell.delegate = self
            if nameUser == nil {
                nameCell.clearTextField()
            }
            cell = nameCell
        case 1:
            guard let photoCell = tableView.dequeueReusableCell(withIdentifier: PhotoUserTableViewCell.reuseIdentifier, for: indexPath) as? PhotoUserTableViewCell else { return cell }
            photoCell.delegate = self
            photoCell.configureImage(image: takeImage)
            cell = photoCell
        case 2:
            guard let chartsCell = tableView.dequeueReusableCell(withIdentifier: ChartsTableViewCell.reuseIdentifier, for: indexPath) as? ChartsTableViewCell else { return cell }
            cell = chartsCell
        default:
            break
        }
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            break
        case 1:
            presenter?.openFinderPhoto()
        case 2:
            presenter?.goToCharts()
        default:
            break
        }
    }
}

extension PrincipalViewController: NameUserTableViewCellDelegate, PhotoUserTableViewCellDelegate {
    func getName(name: String) {
        self.nameUser = name
        presenter?.validateSendInfo(info: ModelPhoto(photo: self.takeImage, name: self.nameUser))
    }
    
    func hiddeKeyboard() {
        self.view.endEditing(true)
    }
    
    func goToSeeImage() {
        presenter?.seeAllImage(image: self.takeImage)
    }
}

extension PrincipalViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else { return }
        self.takeImage = image
        DispatchQueue.main.async {
            self.presenter?.validateSendInfo(info: ModelPhoto(photo: self.takeImage, name: self.nameUser))
            self.principalTable.reloadRows(at: [IndexPath(row: 1, section: 0)], with: .automatic)
        }
    }
}
