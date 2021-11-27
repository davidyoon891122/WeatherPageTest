//
//  WeatherViewController.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/20.
//

import UIKit

class WeatherViewController: UIViewController {
    // MARK: - Properties
    
    private let reuseIdentifierForCollectionView = "CELL"
    
    private let weatherBoardVerticalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.backgroundColor = .orange
        stackView.distribution = .fillProportionally
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private let weatherStatusByTimeCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .yellow
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private let weatherForecaseByDayTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .green
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "강남구"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let weatherDescription: UILabel = {
        let label = UILabel()
        label.text = "안개"
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let degreeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 70)
        label.textAlignment = .center
        label.text = "10º"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let maxLabel: UILabel = {
        let label = UILabel()
        label.text = "최고: 16º"
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let minLabel: UILabel = {
        let label = UILabel()
        label.text = "최저: 5º"
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
        setCollectionViewDelegate()
    }
    
    private func addSubviews() {
        view.addSubview(weatherBoardVerticalStackView)
        view.addSubview(weatherStatusByTimeCollectionView)
        view.addSubview(weatherForecaseByDayTableView)
        
        weatherBoardVerticalStackView.addSubview(locationLabel)
        weatherBoardVerticalStackView.addSubview(weatherDescription)
        weatherBoardVerticalStackView.addSubview(degreeLabel)
        weatherBoardVerticalStackView.addSubview(maxLabel)
        weatherBoardVerticalStackView.addSubview(minLabel)
        
    }
    
    private func setLayoutConstrains() {
        weatherBoardVerticalStackView.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor).isActive = true
        weatherBoardVerticalStackView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherBoardVerticalStackView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weatherBoardVerticalStackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        weatherStatusByTimeCollectionView.topAnchor.constraint(equalTo: weatherBoardVerticalStackView.bottomAnchor).isActive = true
        weatherStatusByTimeCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherStatusByTimeCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weatherStatusByTimeCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        weatherForecaseByDayTableView.topAnchor.constraint(equalTo: weatherStatusByTimeCollectionView.bottomAnchor).isActive = true
        weatherForecaseByDayTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        weatherForecaseByDayTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        weatherForecaseByDayTableView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        
        locationLabel.topAnchor.constraint(equalTo: super.view.safeAreaLayoutGuide.topAnchor, constant: 60).isActive = true
        locationLabel.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        locationLabel.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        weatherDescription.topAnchor.constraint(equalTo: locationLabel.bottomAnchor).isActive = true
        weatherDescription.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        weatherDescription.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        weatherDescription.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        degreeLabel.topAnchor.constraint(equalTo: weatherDescription.bottomAnchor).isActive = true
        degreeLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        degreeLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        degreeLabel.heightAnchor.constraint(equalToConstant: 90).isActive = true
        
        maxLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor).isActive = true
        maxLabel.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        maxLabel.widthAnchor.constraint(equalToConstant: view.frame.width/2 - 2).isActive = true
        
        minLabel.topAnchor.constraint(equalTo: degreeLabel.bottomAnchor).isActive = true
        minLabel.leftAnchor.constraint(equalTo: maxLabel.rightAnchor, constant: 2).isActive = true
        minLabel.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    private func setCollectionViewDelegate() {
        weatherStatusByTimeCollectionView.register(WeatherStatusCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierForCollectionView)
        
        weatherStatusByTimeCollectionView.delegate = self
        weatherStatusByTimeCollectionView.dataSource = self
    }
    
    // MARK: - Handlers

}


// MARK: - Extensions
extension WeatherViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierForCollectionView, for: indexPath)
        return cell
    }
    
    
}


extension WeatherViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 5, height: 90)
    }
}


extension WeatherViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        return UITableViewCell()
    }
    
    
}
