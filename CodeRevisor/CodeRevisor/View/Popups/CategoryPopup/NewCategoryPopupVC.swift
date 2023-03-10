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

    private var txtCategory: ThemeTextField = ThemeTextField()
    
    private lazy var lblTitle: TitleLabel = TitleLabel()
    private lazy var lblDesc: DescLabel = DescLabel()
    
    private lazy var btnDone: GreenButton = GreenButton()
    private lazy var btnCancel: RedButton = RedButton()
    
    private lazy var vStack: UIStackView = UIStackView()
    private lazy var hStack: UIStackView = UIStackView()
    
    //------------------------------------------------------
    
    //MARK:- Class Variable
    private var viewModel = NewCategoryViewModel()
    private var manager = CategoryManager()
    var editCategory: Categories?
    var newCreated: (() -> ())?
    
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
        view.backGroundColor(color: .primaryText.withAlphaComponent(0.1))
        view.addTapGestureRecognizer {
            self.view.endEditing(true)
            self.dismiss(animated: true)
        }
        view.addSubview(centerView, anchors: [
            .leading(12), .trailing(-12),
            .centerY(0)
        ])
        
        txtCategory.activate(anchors: [
            .height(44)
        ])
        txtCategory.delegate = self
        txtCategory.becomeFirstResponder()
        
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
        lblDesc.text = "" //"If category with same name exist then it will not be re created."
        lblTitle.text = (editCategory == nil) ? Constants.newCategory : Constants.editCategory
        txtCategory.text = (editCategory == nil) ? "" : (editCategory?.category ?? "")
        btnDone.setTitle(Constants.confirm, for: .normal)
        btnCancel.setTitle(Constants.cancel, for: .normal)
        
        btnDone.addTarget(self, action: #selector(btnActionDone), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(btnActionCancel), for: .touchUpInside)
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc func btnActionDone() {
        if let er = viewModel.isValidView(category: txtCategory.cleanTrimmedText) {
            Alert.shared.showSnackBar(er.errorDescription ?? "",isError: true)
        } else {
            if let cat = editCategory {
                let _ = manager.updateCategory(category: Categories(category: txtCategory.cleanTrimmedText, id: cat.id))
            } else {
                manager.createCategory(category: Categories(category: txtCategory.cleanTrimmedText, id: UUID()))
            }
            self.dismiss(animated: true) {
                self.newCreated?()
            }
        }
    }
    
    @objc func btnActionCancel() {
        self.dismiss(animated: true)
    }
    //------------------------------------------------------
}

extension NewCategoryPopupVC: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isBackspace() {
            return true
        }
        if textField == txtCategory {
            return string.isValid(.alphabetNumWithSpace)
        }
        
        return true
    }
}


