//
//  WeatherStatusCollectionViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/24.
//

import UIKit

class WeatherStatusCollectionViewCell: UICollectionViewCell {
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "15:21"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.min")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.text = "9º"
        label.font = UIFont.systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setLayoutConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(timeLabel)
        addSubview(weatherIconImage)
        addSubview(degreeLabel)
    }
    
    private func setLayoutConstrains() {
        timeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        timeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        weatherIconImage.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 5).isActive = true
        weatherIconImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherIconImage.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        degreeLabel.topAnchor.constraint(equalTo: weatherIconImage.bottomAnchor, constant: 5).isActive = true
        degreeLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        degreeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 2).isActive = true
        degreeLabel.heightAnchor.constraint(equalToConstant: 25).isActive = true
        
    }
}
