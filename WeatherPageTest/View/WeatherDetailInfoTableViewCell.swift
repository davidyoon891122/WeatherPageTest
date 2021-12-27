//
//  weatherDetailInfoTableViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/29.
//

import UIKit

class WeatherDetailInfoTableViewCell: UITableViewCell {
    // MARK: - properties
    
    private lazy var cellStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var thirdStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var fourthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var fifthStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var secondLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var secondDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var thirdLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var thirdDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fourthLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fourthDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fifthLabelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var fifthDataStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    let sunriseTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일출"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sunriseContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오전 7:26"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let sunsetTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "일몰"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let sunsetContentLabel: UILabel = {
        let label = UILabel()
        label.text = "오후 5:14"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    let cloudChanceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "구름"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let cloudChanceContentLabel: UILabel = {
        let label = UILabel()
        label.text = "10%"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 25)
        return label
    }()
    
    let humidityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "습도"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let humidityContentLabel: UILabel = {
        let label = UILabel()
        label.text = "80%"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "바람"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let windContentLabel: UILabel = {
        let label = UILabel()
        label.text = "동 1m/s"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let feelslikeTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "체감"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let feelslikeContentLabel: UILabel = {
        let label = UILabel()
        label.text = "-1º"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rainTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "강우량"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let rainContentLabel: UILabel = {
        let label = UILabel()
        label.text = "0cm"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pressureTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "기압"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pressureContentLabel: UILabel = {
        let label = UILabel()
        label.text = "1016hPa"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let visibilityTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "가시거리"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let visibilityContentLabel: UILabel = {
        let label = UILabel()
        label.text = "1.9km"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uviTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "자외선 지수"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let uviContentLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstSeparator: SeparatorView = {
        let separator = SeparatorView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var secondSeparator: SeparatorView = {
        let separator = SeparatorView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var thirdSeparator: SeparatorView = {
        let separator = SeparatorView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    private lazy var fourthSeparator: SeparatorView = {
        let separator = SeparatorView(frame: .zero)
        separator.translatesAutoresizingMaskIntoConstraints = false
        return separator
    }()
    
    
    
    //let secondTitleLabel
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setLayoutConstraints()
        selectionStyle = .none
    }
    
    
    func setupData(response: WeatherResponse?) {
        guard let response = response else {
            return
        }
        //print(response)
        self.sunriseContentLabel.text = "\(self.getDateTimeFromUTC(dateTime: response.daily.first?.sunrise ?? 0, format: "a hh:MM"))"
        self.sunsetContentLabel.text = "\(self.getDateTimeFromUTC(dateTime: response.daily.first?.sunset ?? 0, format: "a hh:MM"))"
        self.cloudChanceContentLabel.text = "\(Int(response.current.clouds))%"
        
        self.humidityContentLabel.text = "\(Int(response.current.humidity))%"
        self.windContentLabel.text = "\(response.current.windSpeed)m/s"
        self.feelslikeContentLabel.text = "\(self.fahrenheitToCelcius(fahrentheit: response.current.feelsLike))º"
        
        if let rain = response.daily.first?.rain {
            self.rainContentLabel.text = "\(rain)mm"
        }else {
            self.rainContentLabel.text = "0mm"
        }
        self.pressureContentLabel.text = "\(response.current.pressure)hPa"
        self.visibilityContentLabel.text = "\(Int(response.current.visibility))"
        self.uviContentLabel.text = "\(Int(response.current.uvi))"
    }
    
    private func addSubviews() {
        self.addSubview(self.firstStackView)
        self.addSubview(self.firstSeparator)
        self.addSubview(self.secondStackView)
        self.addSubview(self.secondSeparator)
        self.addSubview(self.thirdStackView)
        self.addSubview(self.thirdSeparator)
        self.addSubview(self.fourthStackView)
        self.addSubview(self.fourthSeparator)
        self.addSubview(self.fifthStackView)
        
        
        self.firstStackView.addArrangedSubview(self.firstLabelStackView)
        self.firstStackView.addArrangedSubview(self.firstDataStackView)
        
        self.firstLabelStackView.addArrangedSubview(self.sunriseTitleLabel)
        self.firstLabelStackView.addArrangedSubview(self.sunsetTitleLabel)
        
        self.firstDataStackView.addArrangedSubview(self.sunriseContentLabel)
        self.firstDataStackView.addArrangedSubview(self.sunsetContentLabel)
        
        
        self.secondStackView.addArrangedSubview(self.secondLabelStackView)
        self.secondStackView.addArrangedSubview(self.secondDataStackView)

        self.secondLabelStackView.addArrangedSubview(self.cloudChanceTitleLabel)
        self.secondLabelStackView.addArrangedSubview(self.humidityTitleLabel)

        self.secondDataStackView.addArrangedSubview(self.cloudChanceContentLabel)
        self.secondDataStackView.addArrangedSubview(self.humidityContentLabel)
        
        self.thirdStackView.addArrangedSubview(self.thirdLabelStackView)
        self.thirdStackView.addArrangedSubview(self.thirdDataStackView)
        
        self.thirdLabelStackView.addArrangedSubview(self.windTitleLabel)
        self.thirdLabelStackView.addArrangedSubview(self.feelslikeTitleLabel)
        
        self.thirdDataStackView.addArrangedSubview(self.windContentLabel)
        self.thirdDataStackView.addArrangedSubview(self.feelslikeContentLabel)
        
        self.fourthStackView.addArrangedSubview(self.fourthLabelStackView)
        self.fourthStackView.addArrangedSubview(self.fourthDataStackView)
        
        self.fourthLabelStackView.addArrangedSubview(self.rainTitleLabel)
        self.fourthLabelStackView.addArrangedSubview(self.pressureTitleLabel)
        
        self.fourthDataStackView.addArrangedSubview(self.rainContentLabel)
        self.fourthDataStackView.addArrangedSubview(self.pressureContentLabel)
        
        self.fifthStackView.addArrangedSubview(self.fifthLabelStackView)
        self.fifthStackView.addArrangedSubview(self.fifthDataStackView)
        
        self.fifthLabelStackView.addArrangedSubview(self.visibilityTitleLabel)
        self.fifthLabelStackView.addArrangedSubview(self.uviTitleLabel)
        
        self.fifthDataStackView.addArrangedSubview(self.visibilityContentLabel)
        self.fifthDataStackView.addArrangedSubview(self.uviContentLabel)
        
    }
    
    private func setLayoutConstraints() {
        
        self.firstStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        self.firstStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.firstStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        self.firstSeparator.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: 5).isActive = true
        self.firstSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.firstSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.secondStackView.topAnchor.constraint(equalTo: self.firstSeparator.bottomAnchor, constant: 5).isActive = true
        self.secondStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.secondStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        self.secondSeparator.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: 5).isActive = true
        self.secondSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.secondSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.thirdStackView.topAnchor.constraint(equalTo: self.secondSeparator.bottomAnchor, constant: 5).isActive = true
        self.thirdStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.thirdStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        self.thirdSeparator.topAnchor.constraint(equalTo: self.thirdStackView.bottomAnchor, constant: 5).isActive = true
        self.thirdSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.thirdSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.fourthStackView.topAnchor.constraint(equalTo: self.thirdSeparator.bottomAnchor, constant: 5).isActive = true
        self.fourthStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.fourthStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        self.fourthSeparator.topAnchor.constraint(equalTo: self.fourthStackView.bottomAnchor, constant: 5).isActive = true
        self.fourthSeparator.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.fourthSeparator.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.fifthStackView.topAnchor.constraint(equalTo: self.fourthSeparator.bottomAnchor, constant: 5).isActive = true
        self.fifthStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        self.fifthStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        
        

        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
    private func fahrenheitToCelcius(fahrentheit: Double) -> Int {
        return Int((fahrentheit - 273.15))
    }
    
    private func getDateTimeFromUTC(dateTime: Double, format: String) -> String {
        let date = Date(timeIntervalSince1970: dateTime)
        let dateFomatter = DateFormatter()
        dateFomatter.locale = Locale(identifier: "ko")
        dateFomatter.dateFormat = format
        return dateFomatter.string(from: date)
    }
}

// MARK: Extensions
