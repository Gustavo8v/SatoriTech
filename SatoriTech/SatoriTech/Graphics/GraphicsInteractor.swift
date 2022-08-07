//
//  GraphicsInteractor.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import Foundation
import FirebaseDatabase

class GraphicsInteractor: GraphicsInteractorProtocol {
    
    var presenter: GraphicsPresenterProtocol?
    let database = Database.database().reference()
    
    func getDataStores() {
        let urlRequest = URL(string: "https://satoritech.com.mx/api/test")
        var request = URLRequest(url: urlRequest!)
        request.httpMethod = "GET"
        URLSession.shared.dataTask(with: request) { data, response, error in
            let httpRequest = response as? HTTPURLResponse
            switch httpRequest?.statusCode {
            case 200:
                do {
                    if let jData = data {
                        let decodeData = try JSONDecoder().decode(GraphicsEntity.self, from: jData)
                        self.database.child("colores").observeSingleEvent(of: .value) { snapshot in
                            guard let value = snapshot.value as? [String:Any] else { return }
                            self.presenter?.bringDataStore(data: decodeData, colors: value)
                        }
                    }
                } catch {
                    print("❗️Error func ➡️ 'getDataStores()': error decode❗️")
                }
            default:
                print("❗️Error func ➡️ 'getDataStores()': error code service❗️")
            }
        }.resume()
    }
}
