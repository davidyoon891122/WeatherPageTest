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
    
    
    let snowChanceTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "눈 올 확률"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let snowChanceContentLabel: UILabel = {
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
    
    
    //let secondTitleLabel
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //self.backgroundColor = .blue
        addSubviews()
        setLayoutConstraints()
    }
    
    private func addSubviews() {
        self.addSubview(self.firstStackView)
        self.addSubview(self.firstSeparator)
        self.addSubview(self.secondStackView)
        self.addSubview(self.secondSeparator)
        self.addSubview(self.thirdStackView)
        self.addSubview(self.thirdSeparator)
        
        
        self.firstStackView.addArrangedSubview(self.firstLabelStackView)
        self.firstStackView.addArrangedSubview(self.firstDataStackView)
        
        self.firstLabelStackView.addArrangedSubview(self.sunriseTitleLabel)
        self.firstLabelStackView.addArrangedSubview(self.sunsetTitleLabel)
        
        self.firstDataStackView.addArrangedSubview(self.sunriseContentLabel)
        self.firstDataStackView.addArrangedSubview(self.sunsetContentLabel)
        
        
        self.secondStackView.addArrangedSubview(self.secondLabelStackView)
        self.secondStackView.addArrangedSubview(self.secondDataStackView)

        self.secondLabelStackView.addArrangedSubview(self.snowChanceTitleLabel)
        self.secondLabelStackView.addArrangedSubview(self.humidityTitleLabel)

        self.secondDataStackView.addArrangedSubview(self.snowChanceContentLabel)
        self.secondDataStackView.addArrangedSubview(self.humidityContentLabel)
        
        self.thirdStackView.addArrangedSubview(self.thirdLabelStackView)
        self.thirdStackView.addArrangedSubview(self.thirdDataStackView)
        
        self.thirdLabelStackView.addArrangedSubview(self.windTitleLabel)
        self.thirdLabelStackView.addArrangedSubview(self.feelslikeTitleLabel)
        
        self.thirdDataStackView.addArrangedSubview(self.windContentLabel)
        self.thirdDataStackView.addArrangedSubview(self.feelslikeContentLabel)
        
        
//        addSubview(firstTitleLabel)
//        addSubview(firstContentLabel)
//
//        addSubview(secondTitleLabel)
//        addSubview(secondContentLabel)
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
        
//        self.secondStackView.topAnchor.constraint(equalTo: self.separator.bottomAnchor).isActive = true
//        self.secondStackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
//        self.secondStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 16).isActive = true
//        firstTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
//        firstTitleLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
//
//        firstContentLabel.topAnchor.constraint(equalTo: firstTitleLabel.bottomAnchor, constant: 5).isActive = true
//        firstContentLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 20).isActive = true
//
//        secondTitleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
//        secondTitleLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -150).isActive = true
//
//        secondContentLabel.topAnchor.constraint(equalTo: secondTitleLabel.bottomAnchor, constant: 5).isActive = true
//        secondContentLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -70).isActive = true
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}

// MARK: Extensions
