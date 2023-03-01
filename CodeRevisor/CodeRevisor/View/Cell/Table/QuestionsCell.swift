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
    private var lblQuery = SubTitleLabel()
    private var lblAnswer = GreenLabel()
    private var lblDate = NoteLabel()
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
        let h2Stack = UIStackView()
        h2Stack.addArrangedSubview(lblQuery)
        h2Stack.addArrangedSubview(lblDate)
        
        vStack.addArrangedSubview(h2Stack)
        vStack.addArrangedSubview(lblAnswer)
    }
    
    private func setupHStack() {
        mainView.addSubview(hStack, anchors: [
            .leading(8), .trailing(-8),
            .top(8), .bottom(-8)
        ])
        let view = UIView()
        view.backGroundColor(color: .clear)
        view.addSubview(imgUser, anchors: [
            .top(0), .leading(0), .trailing(0)
        ])
        hStack.addArrangedSubview(view)
        hStack.addArrangedSubview(vStack)
    }
    
    private func setupView() {
        addSubview(mainView, anchors: [
            .leading(14) , .trailing(-12),
            .top(8) , .bottom(-8)
        ])
        imgUser.activate(anchors: [
            .width(50), .height(50)
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
//        lblQuery.numberOfLines = 2
        lblQuery.setContentHuggingPriority(UILayoutPriority.dragThatCanResizeScene, for: .vertical)
        lblQuery.setContentCompressionResistancePriority(UILayoutPriority.required, for: .vertical)
        
        
        lblAnswer.numberOfLines = 3
        lblAnswer.setContentHuggingPriority(UILayoutPriority.dragThatCanResizeScene, for: .vertical)
        lblAnswer.setContentHuggingPriority(UILayoutPriority.dragThatCannotResizeScene, for: .horizontal)
        lblAnswer.setContentCompressionResistancePriority(UILayoutPriority.defaultHigh, for: .vertical)
    }
    
    func configureData() {
        lblQuery.text = "Difference between Async and Sync"//data.title
        lblAnswer.text = "Async Task works simulatenously on multiple thread while Sync Task is executed sequentially one after the other."
        lblDate.text = "26 Dec\n2022"
        imgUser.image = UIImage(systemName: "questionmark.diamond.fill")
    }
}
