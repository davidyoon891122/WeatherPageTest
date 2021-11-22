//
//  WeatherViewController.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/20.
//

import UIKit

class WeatherViewController: UIViewController {
    // MARK: - Properties
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "강남구"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDescription: UILabel = {
        let label = UILabel()
        label.text = "안개"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 50)
        label.text = "10º"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxLabel: UILabel = {
        let label = UILabel()
        label.text = "최고: 16º"
        label.textAlignment = .right
        //label.layer.borderWidth = 2
        //label.layer.borderColor = UIColor.black.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minLabel: UILabel = {
        let label = UILabel()
        label.text = "최저: 5º"
        //label.layer.borderWidth = 2
        //label.layer.borderColor = UIColor.black.cgColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let hStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .red
        return tableView
    }()
    
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setLayoutConstrains()
    }
    
    private func addSubviews() {
        view.addSubview(locationLabel)
        view.addSubview(weatherDescription)
        view.addSubview(degreeLabel)
        view.addSubview(maxLabel)
        view.addSubview(minLabel)
        view.addSubview(hStackView)
        view.addSubview(tableView)
    }
    
    private func setLayoutConstrains() {
        locationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        locationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        weatherDescription.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 5).isActive = true
        weatherDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        degreeLabel.topAnchor.constraint(equalTo: weatherDescription.bottomAnchor, constant: 5).isActive = true
        degreeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        degreeLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        
        maxLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor).isActive = true
        //maxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        maxLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
        minLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor).isActive = true
        //minLabel.leftAnchor.constraint(equalTo: maxLabel.rightAnchor).isActive = true
        minLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        minLabel.widthAnchor.constraint(equalToConstant: 180).isActive = true
        
    }
    
    
    // MARK: - Handlers

}
