//
//  GeneralPopupVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 29/01/23.
//

import UIKit

class GeneralPopupVC: UIViewController {
    
    //MARK:- Outlet
    private lazy var centerView : UIView = {
        let view = UIView()
        view.backGroundColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
        return view
    }()
    
    private var lblTitle: TitleLabel = TitleLabel()
    private var lblDesc: DescLabel = DescLabel()
    
    private var btnCancel: RedButton = RedButton()
    private var btnDone: GreenButton = GreenButton()
    
    private let vStack: UIStackView = UIStackView()
    private let hStack: UIStackView = UIStackView()
    
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
        lblDesc.text = "Some description here"
        lblTitle.text = "Title here"
        btnDone.setTitle(Constants.confirm, for: .normal)
        btnCancel.setTitle(Constants.cancel, for: .normal)
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    
    
    //------------------------------------------------------
}
