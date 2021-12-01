//
//  weatherDetailInfoTableViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/29.
//

import UIKit

class WeatherDetailInfoTableViewCell: UITableViewCell {
    
    // MARK: - properties
    let firstTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일출"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let firstContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오전 7:26"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let secondTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일몰"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let secondContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오후 5:14"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //let secondTitleLabel
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setLayoutConstraints()
    }
    
    private func addSubviews() {
        addSubview(firstTitleLabel)
        addSubview(firstContentLabel)
        
        addSubview(secondTitleLabel)
        addSubview(secondContentLabel)
    }
    
    private func setLayoutConstraints() {
        firstTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        firstTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        firstContentLabel.topAnchor.constraint(equalTo: firstTitleLabel.bottomAnchor, constant: 5).isActive = true
        firstContentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
        
        secondTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
        secondTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -150).isActive = true
        
        secondContentLabel.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 5).isActive = true
        secondContentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -70).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}

// MARK: Extensions
