//
//  CategoryCell.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 20/01/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    private lazy var lblName: CenterLabel = CenterLabel()
    lazy var btnDelete: PlainButton = PlainButton()
    lazy var btnEdit: PlainButton = PlainButton()
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backGroundColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
            .shadow()
        return view
    }()
    
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
        btnDelete.setImage(UIImage(systemName: "trash.fill"), for: .normal)
        btnDelete.tintColor = .red
        
        btnEdit.setImage(UIImage(systemName: "pencil.circle.fill"), for: .normal)
        btnEdit.tintColor = .green
        
        addSubview(bgView, anchors: [
            .leading(4), .trailing(-4),
            .top(4), .bottom(-4)
        ])
        bgView.addSubview(lblName, anchors: [
            .centerY(0),
            .leading(4), .trailing(-4)
        ])
        bgView.addSubview(btnDelete, anchors: [
            .top(8), .leading(8)
        ])
        
        bgView.addSubview(btnEdit, anchors: [
            .top(8), .trailing(-8)
        ])
    }
    
    func configureCell(category: Categories) {
        lblName.text = category.category
    }
}
