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
        label.font = .systemFont(ofSize: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maxLabel: UILabel = {
        let label = UILabel()
        label.text = "0º"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    
    
    func setup(daily: Daily) {
        addSubviews()
        setLayoutConstraint()
        backgroundColor = .systemBackground
        self.dayLabel.text = getDateTimeFromUTC(dateTime: daily.dt)
        self.minLabel.text = "\(fahrenheitToCelcius(fahrentheit: daily.temp.min))º"
        self.maxLabel.text = "\(fahrenheitToCelcius(fahrentheit: daily.temp.max))º"
        self.weatherImage.image = iconStringToImage(icon: daily.weather.first?.icon ?? "")
        
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
        maxLabel.rightAnchor.constraint(equalTo: minLabel.leftAnchor, constant: -20).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        minLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        minLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        minLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        minLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func getDateTimeFromUTC(dateTime: Double) -> String {
        let date = Date(timeIntervalSince1970: dateTime)
        let dateFomatter = DateFormatter()
        dateFomatter.locale = Locale(identifier: "ko")
        dateFomatter.dateFormat = "EEEE"
        return dateFomatter.string(from: date)
    }
    
    func fahrenheitToCelcius(fahrentheit: Double) -> Int {
        return Int((fahrentheit - 273.15))
    }
    
    func iconStringToImage(icon: String) -> UIImage {
        switch icon {
        case "01d":
            return UIImage(systemName: "sun.max.fill") ?? UIImage()
        case "13d":
            return UIImage(systemName: "cloud.snow.fill") ?? UIImage()
        case "04d":
            return UIImage(systemName: "cloud.fill") ?? UIImage()
        default:
            return UIImage(systemName: "sun.max.fill") ?? UIImage()
        }
    }
}
