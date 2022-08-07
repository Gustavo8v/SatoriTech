//
//  InfoChartsTableViewCell.swift
//  SatoriTech
//
//  Created by Gustavo Gutierrez on 07/08/22.
//

import UIKit
import Charts

class InfoChartsTableViewCell: UITableViewCell {

    @IBOutlet private weak var lineChart: PieChartView!
    @IBOutlet private weak var questionCell: UILabel!
    
    var colors: [UIColor] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func getColors(colors: [String]){
        colors.forEach { value in
            let color = UIColor().colorFromHex(value)
            self.colors.append(color)
        }
    }

    func setChart(chart: [InfoStore], question: String){
        questionCell.text = question
        var entries: [PieChartDataEntry] = []
        chart.forEach { char in
            let dataEntry = PieChartDataEntry(value: Double(char.value ?? .zero), label: char.name)
            entries.append(dataEntry)
        }
        let set = PieChartDataSet(entries: entries)
        set.colors = colors
        let data = PieChartData(dataSet: set)
        self.lineChart.data = data
    }
}
