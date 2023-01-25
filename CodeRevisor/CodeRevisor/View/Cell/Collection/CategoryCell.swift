//
//  CategoryCell.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 20/01/23.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    static let identifier = "CategoryCell"
    
    private var lblName:UILabel {
        let lbl = UILabel()
        lbl.textColor(color: .primaryText)
            .font(name: .semibold,size: 14)
            .textAlignment = .center
        return lbl
    }
    private var bgView: UIView {
        let view = UIView()
        view.backGroundColor(color: .primaryText.withAlphaComponent(0.05))
            .cornerRadius(cornerRadius: 12)
        return view
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    private func setupViews() {
        addSubview(bgView, anchors: [
            .leading(12), .trailing(-12),
            .top(12), .bottom(-12)
        ])
        
        bgView.addSubview(lblName, anchors: [
            .leading(8), .trailing(8),
            .centerY(0)
        ])
    }
}
