//
//  GroupViewCell.swift
//  withOutStoryboard
//
//  Created by Valia Smolin on 26.05.2024.
//

import UIKit

final class GroupViewCell: UITableViewCell {
    private var avatar = UIImageView(image: UIImage(systemName: "person"))
    private var name: UILabel = {
        var name = UILabel()
        name.text = "Valia"
        name.textColor = .black
        return name
    } ()
    private var label: UILabel = {
        var name = UILabel()
        name.text = "Valia"
        name.textColor = .black
        return name
    } ()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupUI() {
        contentView.addSubview(avatar)
        contentView.addSubview(name)
        contentView.addSubview(label)
        avatar.translatesAutoresizingMaskIntoConstraints = false
        name.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            avatar.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            avatar.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            avatar.heightAnchor.constraint(equalToConstant: 50),
            avatar.widthAnchor.constraint(equalTo: avatar.heightAnchor),
            name.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            name.leadingAnchor.constraint(equalTo: avatar.trailingAnchor, constant: 10),
            name.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            label.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 10),
            label.leadingAnchor.constraint(equalTo: name.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: name.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
                ])
        
    }
}
