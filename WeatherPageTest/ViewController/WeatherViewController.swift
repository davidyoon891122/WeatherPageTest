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
    private let reuseIdentifierForTableView = "TableViewCell"
    private let reuseIdentifierForTableViewDescription = "TableViewDescriptionCell"
    private let reuseIdentifierFOrTableViewDetailInfo = "TableViewDetailInfoCell"
    
    private let daysOnWeek:[String] = ["월요일", "화요일", "수요일", "목요일", "금요일", "토요일", "일요일", "월요일"]
    
    private let detailInfoFirstTitles:[String] = ["일출", "비 올 확률","바람", "강수량","가시거리"]
    private let detailInfoSecondTitles:[String] = ["일몰", "습도", "체감", "기압", "자외선 지수" ]
    
    private var weatherBoardHeightConstraint: NSLayoutConstraint?
    private var locationLabelTopConstraint: NSLayoutConstraint?
    private var isFold = false
    
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
        tableView.backgroundColor = .white
        //tableView.separatorStyle = .none
        tableView.estimatedRowHeight = 900
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.text = "강남구"
        label.font = UIFont.boldSystemFont(ofSize: 25)
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
    
    private let foldButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Fold", for: .normal)
        button.setTitle("Unfold", for: .selected)
        button.layer.borderWidth = 2
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(foldButtonOnClicked), for: .touchUpInside)
        return button
    }()
    
    
    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        addSubviews()
        setLayoutConstrains()
        setCollectionViewDelegate()
        setTableViewDelegate()
        setPanGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        weatherForecaseByDayTableView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height )
    }
    
    
    private func addSubviews() {
        //view.addSubview(mainScrollView)
        
        view.addSubview(weatherBoardVerticalStackView)
        view.addSubview(weatherStatusByTimeCollectionView)
        view.addSubview(weatherForecaseByDayTableView)
        
        weatherBoardVerticalStackView.addSubview(foldButton)
        weatherBoardVerticalStackView.addSubview(locationLabel)
        weatherBoardVerticalStackView.addSubview(weatherDescription)
        weatherBoardVerticalStackView.addSubview(degreeLabel)
        weatherBoardVerticalStackView.addSubview(maxLabel)
        weatherBoardVerticalStackView.addSubview(minLabel)
        
    }
    
    private func setLayoutConstrains() {
        weatherBoardVerticalStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        weatherBoardVerticalStackView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        weatherBoardVerticalStackView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        
        weatherBoardHeightConstraint = weatherBoardVerticalStackView.heightAnchor.constraint(equalToConstant: 300)
        weatherBoardHeightConstraint?.isActive = true
        
        weatherStatusByTimeCollectionView.topAnchor.constraint(equalTo: weatherBoardVerticalStackView.bottomAnchor).isActive = true
        weatherStatusByTimeCollectionView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        weatherStatusByTimeCollectionView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        weatherStatusByTimeCollectionView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        
        weatherForecaseByDayTableView.topAnchor.constraint(equalTo: weatherStatusByTimeCollectionView.bottomAnchor).isActive = true
        weatherForecaseByDayTableView.leftAnchor.constraint(equalTo: super.view.leftAnchor).isActive = true
        weatherForecaseByDayTableView.rightAnchor.constraint(equalTo: super.view.rightAnchor).isActive = true
        weatherForecaseByDayTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        locationLabelTopConstraint = locationLabel.topAnchor.constraint(equalTo: weatherBoardVerticalStackView.safeAreaLayoutGuide.topAnchor, constant: 40)
        locationLabelTopConstraint?.isActive = true
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
        
        foldButton.topAnchor.constraint(equalTo: weatherBoardVerticalStackView.topAnchor, constant: 50).isActive = true
        foldButton.rightAnchor.constraint(equalTo: weatherBoardVerticalStackView.rightAnchor, constant: -30).isActive = true
        foldButton.widthAnchor.constraint(equalToConstant: 70).isActive = true
        foldButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func setCollectionViewDelegate() {
        weatherStatusByTimeCollectionView.register(WeatherStatusCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifierForCollectionView)
        
        weatherStatusByTimeCollectionView.delegate = self
        weatherStatusByTimeCollectionView.dataSource = self
    }
    
    
    private func setTableViewDelegate() {
        weatherForecaseByDayTableView.delegate = self
        weatherForecaseByDayTableView.dataSource = self
        weatherForecaseByDayTableView.register(WeatherForecaseByDayTableViewCell.self, forCellReuseIdentifier: reuseIdentifierForTableView)
        weatherForecaseByDayTableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseIdentifierForTableViewDescription)
        weatherForecaseByDayTableView.register(WeatherDetailInfoTableViewCell.self, forCellReuseIdentifier: reuseIdentifierFOrTableViewDetailInfo)
    }
    
    private func setPanGesture() {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panAction))
        panGestureRecognizer.delegate = self
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    // MARK: - Handlers

    @objc func panAction(_ sender: UIPanGestureRecognizer) {
        let velocity = sender.velocity(in: view)
        //print("check velocity x: \(velocity.x), velocity y: \(velocity.y)")
        if abs(velocity.x) > abs(velocity.y) {
            velocity.x < 0 ? print("left") : print("right")
        } else if abs(velocity.y) > abs(velocity.x) {
            velocity.y < 0 ? print("up") : print("down")
        }
    }
    
    
    @objc func foldButtonOnClicked(_ sender: UIButton) {
        print("foldButton state: \(sender.state)")
        isFold = !isFold
        if isFold {
            foldButton.setTitle("Unfold", for: .normal)
            weatherBoardHeightConstraint?.isActive = false
            self.weatherBoardHeightConstraint = self.weatherBoardVerticalStackView.heightAnchor.constraint(equalToConstant: 100)
            weatherBoardHeightConstraint?.isActive = true
            
            locationLabelTopConstraint?.isActive = false
            locationLabelTopConstraint = self.locationLabel.topAnchor.constraint(equalTo: self.weatherBoardVerticalStackView.safeAreaLayoutGuide.topAnchor)
            locationLabelTopConstraint?.isActive = true
            UIView.animate(withDuration: 0.8, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.2, options: .curveEaseInOut, animations: { [unowned self] in
                view.layoutIfNeeded()
            }, completion: nil)
            
            
        } else {
            foldButton.setTitle("Fold", for: .normal)
            self.weatherBoardHeightConstraint?.isActive = false
            self.weatherBoardHeightConstraint = self.weatherBoardVerticalStackView.heightAnchor.constraint(equalToConstant: 300)
            self.weatherBoardHeightConstraint?.isActive = true
            
            locationLabelTopConstraint?.isActive = false
            locationLabelTopConstraint = self.locationLabel.topAnchor.constraint(equalTo: weatherBoardVerticalStackView.safeAreaLayoutGuide.topAnchor, constant: 40)
            locationLabelTopConstraint?.isActive = true
            UIView.animate(withDuration: 0.8, delay: 0, options: .curveEaseInOut, animations: { [unowned self] in
                view.layoutIfNeeded()
            }, completion: nil)
        }
    }
    
    
    
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
        if section == 0 {
            return daysOnWeek.count
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 5
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierForTableView, for: indexPath) as! WeatherForecaseByDayTableViewCell
            
            cell.dayLabel.text = daysOnWeek[indexPath.row]
            return cell
        } else if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierForTableViewDescription, for: indexPath)
            cell.textLabel?.text = "오늘: 현재 날씨 맑음, 최고 기온은 8º입니다. 오늘 밤 날씨 청명함, 최저 기온은 -4º"
            cell.textLabel?.numberOfLines = 0
            return cell
        } else if indexPath.section == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierFOrTableViewDetailInfo, for: indexPath) as! WeatherDetailInfoTableViewCell
            cell.firstTitleLabel.text = detailInfoFirstTitles[indexPath.row]
            cell.secondTitleLabel.text = detailInfoSecondTitles[indexPath.row]
            
            return cell
        }else {
            return UITableViewCell()
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        } else if indexPath.section == 1 {
            return 80
        } else if indexPath.section == 2 {
            return 65
        } else {
            return 50
            
        }
    }

    
}


extension WeatherViewController:UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
