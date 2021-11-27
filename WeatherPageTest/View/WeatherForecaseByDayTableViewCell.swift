//
//  WeatherForecaseByDayTableViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/24.
//

import UIKit

class WeatherForecaseByDayTableViewCell: UITableViewCell {
    // MARK: - Properties
    
    private let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "sun.max")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let minDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "11º"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxDegreeLabel: UILabel = {
        let label = UILabel()
        label.text = "-3º"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setLayoutConstraints()
    }
    
    private func addSubviews() {
        addSubview(dayLabel)
        addSubview(weatherIconImageView)
        addSubview(minDegreeLabel)
        addSubview(maxDegreeLabel)
    }
    
    private func setLayoutConstraints() {
        dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 2).isActive = true
        
        weatherIconImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherIconImageView.leftAnchor.constraint(equalTo: dayLabel.rightAnchor).isActive = true
        
        minDegreeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        minDegreeLabel.leftAnchor.constraint(equalTo: weatherIconImageView.rightAnchor).isActive = true
        
        maxDegreeLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        maxDegreeLabel.leftAnchor.constraint(equalTo: minDegreeLabel.rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}
