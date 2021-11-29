//
//  weatherDetailInfoTableViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/29.
//

import UIKit

class WeatherDetailInfoTableViewCell: UITableViewCell {
    
    // MARK: - properties
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "일출"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let contentLabel: UILabel = {
        let label = UILabel()
        label.text = "오전 7:26"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setLayoutConstraints()
    }
    
    private func addSubviews() {
        addSubview(titleLabel)
        addSubview(contentLabel)
    }
    
    private func setLayoutConstraints() {
        titleLabel.topAnchor.constraint(equalTo: topAnchor,constant: 5).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        contentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}

// MARK: Extensions
