//
//  ConfigureLabelPVC + Ext.swift
//  LLL Scan
//
//  Created by Karen Vardanian on 30.03.2024.
//

import UIKit

extension ScanVC {
    func configureLabels() {
        labelForHtml.label.text = "Hello"
        labelForHtml.label.numberOfLines = 0
        
        resultLabel.label.text = "Отсканируйте номер, указанный под штрих-кодом, в формате 'PL 1043199 005 S22'.\n ·Номер начинается с букв, за которыми следует пробел.\n·После пробела идет 7 цифр.\n·Затем следует еще один пробел и 3 цифры.\n·После третьих цифр идут буквы и еще несколько цифр."
        resultLabel.label.textColor = .white
        resultLabel.label.font = UIFont(name: "AppleSDGothicNeo_Bold", size: 36)
        resultLabel.label.numberOfLines = 0
    }
}
