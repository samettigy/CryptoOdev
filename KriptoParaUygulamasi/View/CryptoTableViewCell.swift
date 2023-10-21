//
//  CryptoTableViewCell.swift
//  KriptoParaUygulamasi
//
//  Created by Samet TIG on 21.10.2023.
//

import UIKit

class CryptoTableViewCell: UITableViewCell {
    
    
    let currencyLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let priceLabel : UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func addView() {
        backgroundColor = .clear
        addSubview(currencyLabel)
        addSubview(priceLabel)
        

        
        currencyLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor).isActive = true
        currencyLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        currencyLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
        priceLabel.topAnchor.constraint(equalTo: currencyLabel.bottomAnchor).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
