//
//  NewCategoryPopupVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 30/01/23.
//

import UIKit

class NewCategoryPopupVC: UIViewController {
    
    //MARK:- Outlet
    private lazy var centerView : UIView = {
        let view = UIView()
        view.backGroundColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
        return view
    }()

    private lazy var txtCategory: UITextField = {
        let txt = UITextField()
        txt.textColor(color: .primaryBackground)
            .font(name: .medium,size: 15)
            .backGroundColor(color: .primaryText)
            .cornerRadius(cornerRadius: 10)
            .activate(anchors: [
                .height(44)
            ])
        return txt
    }()
    
    private lazy var lblTitle: TitleLabel = TitleLabel()
    private lazy var lblDesc: DescLabel = DescLabel()
    
    private lazy var btnDone: GreenButton = GreenButton()
    private lazy var btnCancel: RedButton = RedButton()
    
    private lazy var vStack: UIStackView = UIStackView()
    private lazy var hStack: UIStackView = UIStackView()
    
    //------------------------------------------------------
    
    //MARK:- Class Variable
    
    //------------------------------------------------------
    
    //MARK:- Life Cycle Method
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    //------------------------------------------------------
    
    //MARK:- Memory Management Method
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    deinit {
        debugPrint("‼️‼️‼️ deinit : \(self) ‼️‼️‼️")
    }
    
    //------------------------------------------------------
    
    //MARK:- Custom Method
    
    fileprivate func setVStack() {
        vStack.addArrangedSubview(lblTitle)
        vStack.addArrangedSubview(txtCategory)
        vStack.addArrangedSubview(lblDesc)
        vStack.addArrangedSubview(hStack)
        vStack.spacing = 12
        vStack.axis = .vertical
    }
    
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        view.backGroundColor(color: .primaryText.withAlphaComponent(0.5))
        view.addTapGestureRecognizer {
            self.dismiss(animated: true)
        }
        view.addSubview(centerView, anchors: [
            .leading(12), .trailing(-12),
            .centerY(0)
        ])
        
        setHStack()
        setVStack()
        
        centerView.addTapGestureRecognizer { } // UPDATE via extension. Should work on only applied view
        centerView.addSubview(vStack, anchors: [
            .leading(12), .trailing(-12),
            .top(12), .bottom(-12)
        ])
        
        setData()
    }
    
    private func setHStack() {
        hStack.addArrangedSubview(btnCancel)
        hStack.addArrangedSubview(btnDone)
        hStack.distribution = .fillEqually
        hStack.spacing = 12
    }
    
    func setData() {
        lblDesc.text = "If category with same name exist then it will not be re created."
        lblTitle.text = Constants.newCategory
        btnDone.setTitle(Constants.confirm, for: .normal)
        btnCancel.setTitle(Constants.cancel, for: .normal)
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    
    
    //------------------------------------------------------
}
