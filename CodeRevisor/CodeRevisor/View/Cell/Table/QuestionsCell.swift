//
//  QuestionsCell.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 20/01/23.
//

import UIKit

class QuestionsCell: UITableViewCell {
    static let identifier = "QuestionsCell"
    
    private var mainView = UIView()
    private var hStack = UIStackView()
    private var vStack = UIStackView()
    private var lblName = UILabel()
    private var lblDate = UILabel()
    private var lblPrice = UILabel()
    private var imgUser = UIImageView()
     
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        backGroundColor(color: .clear)
        contentView.backGroundColor(color: .clear)
        
        configureHStack()
        configureVStack()
        configureLabels()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        imgUser.setRound()
    }
    
    private func setupVStack() {
        vStack.addArrangedSubview(lblName)
        vStack.addArrangedSubview(lblDate)
    }
    
    private func setupHStack() {
        mainView.addSubview(hStack, anchors: [
            .leading(8), .trailing(-8),
            .top(8), .bottom(-8)
        ])

        hStack.addArrangedSubview(imgUser)
        hStack.addArrangedSubview(vStack)
        hStack.addArrangedSubview(lblPrice)
    }
    
    private func setupView() {
        addSubview(mainView, anchors: [
            .leading(14) , .trailing(-12),
            .top(8) , .bottom(-8)
        ])
        imgUser.activate(anchors: [
            .width(50)
        ])
        
        mainView.backGroundColor(color: .white).cornerRadius(cornerRadius: 8).shadow()
        setupVStack()
        setupHStack()
    }
    
    private func configureVStack() {
        vStack.axis = .vertical
        vStack.spacing = 8
        vStack.alignment = .fill
        vStack.distribution = .fill
    }
    
    private func configureHStack() {
        hStack.axis = .horizontal
        hStack.spacing = 8
        hStack.alignment = .fill
        hStack.distribution = .fill
    }
    
    private func configureLabels() {
        lblName.font(name: .bold, size: 14).textColor(color: .primaryText)
        lblName.setContentHuggingPriority(UILayoutPriority.dragThatCanResizeScene, for: .vertical)
        lblName.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        lblPrice.font(name: .bold, size: 14).textColor(color: .primaryText)
        lblPrice.setContentHuggingPriority(UILayoutPriority.required, for: .horizontal)
        lblPrice.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
        
//        lblDate.font(name: .semiBold, size: 13).textColor(color: .primaryText)
        lblDate.setContentHuggingPriority(UILayoutPriority.dragThatCanResizeScene, for: .vertical)
        lblDate.setContentHuggingPriority(UILayoutPriority.dragThatCannotResizeScene, for: .horizontal)
        lblDate.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
    }
    
    func configureData() {
        lblName.text = "Name"//data.title
        lblDate.text = "Date"//data.date
        lblPrice.text = "$23.0"//"\(data.price)"
        imgUser.image = UIImage(systemName: "questionmark.diamond.fill")//data.image
//        if data.price < 0 {
//            lblPrice.textColor(color: .red)
//        } else {
//            lblPrice.textColor(color: .systemGreen)
//        }
    }
}
