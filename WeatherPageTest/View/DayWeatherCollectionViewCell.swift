//
//  DayWeatherCollectionViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/12/26.
//

import UIKit

class DayWeatherCollectionViewCell: UICollectionViewCell {
    private lazy var dayLabel: UILabel = {
        let label = UILabel()
        label.text = "월요일"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var weatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "sun.min")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var minLabel: UILabel = {
        let label = UILabel()
        label.text = "-10º"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxLabel: UILabel = {
        let label = UILabel()
        label.text = "0º"
        label.font = .systemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    func setup() {
        addSubviews()
        setLayoutConstraint()
        backgroundColor = .systemBackground
    }
    
    
}


private extension DayWeatherCollectionViewCell {
    func addSubviews() {
        [dayLabel, weatherImage, minLabel, maxLabel].forEach{
            addSubview($0)
        }
    }
    
    func setLayoutConstraint() {
        dayLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        dayLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        weatherImage.topAnchor.constraint(equalTo: topAnchor).isActive = true
        weatherImage.leftAnchor.constraint(equalTo: dayLabel.rightAnchor).isActive = true
        weatherImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        weatherImage.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        maxLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        maxLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        maxLabel.rightAnchor.constraint(equalTo: minLabel.leftAnchor, constant: -10).isActive = true
        
        minLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        minLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        minLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        
        
    }
}
