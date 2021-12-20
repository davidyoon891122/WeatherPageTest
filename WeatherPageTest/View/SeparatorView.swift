//
//  SeparatorView.swift
//  WeatherPageTest
//
//  Created by David Yoon on 2021/12/19.
//

import UIKit


class SeparatorView: UIView {
    private lazy var separator: UIView = {
        let view = UIView()
        view.backgroundColor = .separator
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(separator)
        
        self.separator.topAnchor.constraint(equalTo: topAnchor).isActive = true
        self.separator.leftAnchor.constraint(equalTo: leftAnchor, constant: 16).isActive = true
        self.separator.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        self.separator.rightAnchor.constraint(equalTo: rightAnchor, constant: -16).isActive = true
        self.separator.heightAnchor.constraint(equalToConstant: 0.5).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
