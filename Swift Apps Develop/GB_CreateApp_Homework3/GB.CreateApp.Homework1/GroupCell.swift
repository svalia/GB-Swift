//
//  GroupCell.swift
//  GB.CreateApp.Homework1
//
//  Created by Анастасия Рябова on 30.06.2023.
//

import UIKit

final class GroupCell: UITableViewCell {
    
    private var groupImageView = UIImageView(image: UIImage(systemName: "person"))
    
    private var title: UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = .black
        return label
    }()

    private var subtitle: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.textColor = .gray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(groupImageView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        setupConstraints()
    }
    
    private func setupConstraints() {
        groupImageView.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            groupImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            groupImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            groupImageView.heightAnchor.constraint(equalToConstant: 50),
            groupImageView.widthAnchor.constraint(equalTo: groupImageView.heightAnchor),
            
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: groupImageView.trailingAnchor, constant: 10),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            subtitle.leadingAnchor.constraint(equalTo: title.leadingAnchor),
            subtitle.trailingAnchor.constraint(equalTo: title.trailingAnchor),
            subtitle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
    }
}
