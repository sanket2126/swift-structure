//
//  CategoryCell.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 20/01/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    private lazy var lblName: UILabel = {
        let lbl = UILabel()
        lbl.textColor(color: .primaryText)
            .font(name: .bold,size: 16)
            .numberOfLines = 0
        lbl.textAlignment = .center
        return lbl
    }()
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
        addSubview(bgView, anchors: [
            .leading(4), .trailing(-4),
            .top(4), .bottom(-4)
        ])
        bgView.addSubview(lblName, anchors: [
            .centerY(0),
            .leading(4), .trailing(-4)
        ])
    }
    
    func configureCell(index: IndexPath) {
        lblName.text = "Some long description at Index \(index.row + 1)"
    }
}
