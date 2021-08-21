//
//  HeaderView.swift
//  iMusic
//
//  Created by Алим Куприянов on 21.08.2021.
//

import UIKit

class HeaderView: UITableViewHeaderFooterView {
    
// MARK: - static let

    static let reuseId = "Header"

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupLabel()
        setupImageView()
        contentView.backgroundColor = .systemBackground
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let myImage: UIImageView = {
        
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let myLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 19)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.9725490196, green: 0.2509803922, blue: 0.3725490196, alpha: 1)
        return label
    }()
    
    
// MARK: - setup UI Elements

    private func setupLabel() {
        addSubview(myLabel)
        myLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40).isActive = true
        myLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        myLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
    }
    
    private func setupImageView() {
        addSubview(myImage)
        myImage.topAnchor.constraint(equalTo: myLabel.bottomAnchor, constant: 200).isActive = true
        myImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 60).isActive = true
        myImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -60).isActive = true
        myImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 60).isActive = true
    }
}
