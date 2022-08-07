//
//  GraphicsViewController.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 06/08/22.
//

import UIKit

class GraphicsViewController: UIViewController {
    
    @IBOutlet private weak var graphicsTable: UITableView!
    
    var presenter: GraphicsPresenterProtocol?
    var dataTable: GraphicsEntity?
    var colors: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
}

extension GraphicsViewController: GraphicsViewProtocol {
    func setTable() {
        graphicsTable.delegate = self
        graphicsTable.dataSource = self
        graphicsTable.register(UINib(nibName: InfoChartsTableViewCell.reuseIdentifier, bundle: nil), forCellReuseIdentifier: InfoChartsTableViewCell.reuseIdentifier)
    }
    
    func setDataStore(data: GraphicsEntity, colors: [String]) {
        self.dataTable = data
        self.colors = colors
        DispatchQueue.main.async {
            self.graphicsTable.reloadData()
        }
    }
}

extension GraphicsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        guard let typeChart = TypeChart(rawValue: indexPath.row),
              let genericCell = tableView.dequeueReusableCell(withIdentifier: InfoChartsTableViewCell.reuseIdentifier, for: indexPath) as? InfoChartsTableViewCell,
              let indexData = dataTable else { return cell }
        genericCell.getColors(colors: self.colors)
        switch typeChart {
        case .security:
            genericCell.setChart(chart: indexData.security, question: "¿Qué empresas cuentan con medidas de seguridad?")
            cell = genericCell
        case .cleaning:
            genericCell.setChart(chart: indexData.cleaning, question: "¿Estaba limpia la sucursal?")
            cell = genericCell
        }
        return cell
    }
}
