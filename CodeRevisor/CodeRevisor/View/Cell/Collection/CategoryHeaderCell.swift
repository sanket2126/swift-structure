//
//  CategoryHeaderCell.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 29/01/23.
//

import UIKit

class CategoryHeaderCell: UICollectionReusableView {
    
    static let identifier = "CategoryHeaderCell"
    
    private lazy var lblName: UILabel = {
        let lbl = UILabel()
        lbl.textColor(color: .primaryText)
            .font(name: .bold,size: 15)
            .numberOfLines = 0
        lbl.textAlignment = .left
        return lbl
    }()
    
    private lazy var imgAdd: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "plus.app.fill")
        img.tintColor = .green
        img.contentMode = .scaleAspectFit
        return img
    }()
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backGroundColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
            .shadow()
        return view
    }()
    private let vStack: UIStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews() {
        addSubview(bgView, anchors: [
            .leading(8), .trailing(-8),
            .top(8), .bottom(-8)
        ])
        
        vStack.addArrangedSubview(imgAdd)
        vStack.addArrangedSubview(lblName)
        vStack.spacing = 12
        vStack.axis = .horizontal
        
        imgAdd.activate(anchors: [
            .constant(attribute: .width, relation: .equal, constant: 60)
        ])
        
        bgView.addSubview(vStack, anchors: [
            .leading(8), .trailing(-8),
            .top(2), .bottom(-2)
        ])
        
        lblName.text = Constants.addCategory
    }
}
