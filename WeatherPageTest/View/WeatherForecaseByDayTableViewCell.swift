//
//  WeatherForecaseByDayTableViewCell.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/11/24.
//

import UIKit

class WeatherForecaseByDayTableViewCell: UITableViewCell {
    // MARK: - Properties
    private var dailyList: [Daily]?
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 0
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .systemBackground
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.register(DayWeatherCollectionViewCell.self, forCellWithReuseIdentifier: "DayWeatherCollectionViewCell")
        
        return collectionView
    }()
    
    
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setLayoutConstraints()
        selectionStyle = .none
        collectionView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func setupData(dailyData: [Daily]) {
        self.dailyList = dailyData
        self.collectionView.reloadData()
    }
    
    private func addSubviews() {
        addSubview(collectionView)
    }
    
    private func setLayoutConstraints() {
        collectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Handlers
    
}



extension WeatherForecaseByDayTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width - 32, height: 40)
    }
}

extension WeatherForecaseByDayTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dailyList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DayWeatherCollectionViewCell", for: indexPath) as? DayWeatherCollectionViewCell
        guard let daily = dailyList?[indexPath.row] else {
            return UICollectionViewCell()
        }
        cell?.setup(daily: daily)
        return cell ?? UICollectionViewCell()
    }
}
