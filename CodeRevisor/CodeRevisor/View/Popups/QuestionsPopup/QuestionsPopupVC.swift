//
//  QuestionsPopupVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 02/03/23.
//

import UIKit

class QuestionsPopupVC: UIViewController {
    
    //MARK:- Outlet
    private lazy var centerView : UIView = {
        let view = UIView()
        view.backGroundColor(color: .primaryBackground)
            .cornerRadius(cornerRadius: 12)
        return view
    }()

    private var txtQuestion: ThemeTextField = ThemeTextField(_placeHolder: "Question")
    private var txtAnswer: ThemeTextView = ThemeTextView()
    private var txtCategory: ThemeTextField = ThemeTextField(_placeHolder: "Category")
    private var txtRefLinks: ThemeTextField = ThemeTextField(_placeHolder: "Reference Links")
    
    private lazy var lblTitle: TitleLabel = TitleLabel()
    private lazy var lblDesc: DescLabel = DescLabel()
    
    private lazy var btnDone: GreenButton = GreenButton()
    private lazy var btnCancel: RedButton = RedButton()
    private lazy var btnAddLink: PlainButton = PlainButton()
    
    private lazy var vStack: UIStackView = UIStackView()
    private lazy var hStack: UIStackView = UIStackView()
    
    private lazy var pickerView: UIPickerView = UIPickerView()
    
    //------------------------------------------------------
    
    //MARK:- Class Variable
    private var viewModel: QuestionsPopupModel!
    
    //------------------------------------------------------
    
    //MARK:- Life Cycle Method
    convenience init(questionsPopupModel: QuestionsPopupModel) {
        self.init(nibName: nil, bundle: nil)
        self.viewModel = questionsPopupModel
    }
    
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
        vStack.addArrangedSubview(txtQuestion)
        vStack.addArrangedSubview(txtAnswer)
        vStack.addArrangedSubview(txtCategory)
        
        let hStk = UIStackView()
        hStk.axis = .horizontal
        hStk.addArrangedSubview(txtRefLinks)
        hStk.addArrangedSubview(btnAddLink)
        hStk.setCustomSpacing(12, after: txtRefLinks)
        vStack.addArrangedSubview(hStk)

        vStack.addArrangedSubview(hStack)
        vStack.spacing = 12
        vStack.axis = .vertical
    }
    
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        view.backGroundColor(color: .primaryText.withAlphaComponent(0.45))
        view.addTapGestureRecognizer {
            self.view.endEditing(true)
            self.dismiss(animated: true)
        }
        view.addSubview(centerView, anchors: [
            .leading(12), .trailing(-12),
            .centerY(0)
        ])
        
        txtAnswer.activate(anchors: [
            .height(94)
        ])
        
        txtCategory.setRightImage(img: UIImage(systemName: "chevron.down.circle.fill"))
        //setRightView(view: UIImageView(image: ))
//        txtQuestion.delegate = self
        txtQuestion.becomeFirstResponder()
        
        setHStack()
        setVStack()
        setPicker()
        
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
    
    private func setPicker() {
        viewModel.fetchAll()
        txtCategory.inputView = pickerView
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    func setData() {
        lblDesc.text = "sfodmf"
        if let c = viewModel.getSelectedt() {
            txtCategory.text = c.category
        }
        btnAddLink.setTitle(Constants.addLink, for: .normal)
        btnDone.setTitle(Constants.confirm, for: .normal)
        btnCancel.setTitle(Constants.cancel, for: .normal)
        
        btnDone.addTarget(self, action: #selector(btnActionDone), for: .touchUpInside)
        btnCancel.addTarget(self, action: #selector(btnActionCancel), for: .touchUpInside)
        btnAddLink.addTarget(self, action: #selector(btnActionAddLink), for: .touchUpInside)
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc func btnActionDone() {
//        if let er = viewModel.isValidView(category: txtQuestion.cleanTrimmedText) {
//            Alert.shared.showSnackBar(er.errorDescription ?? "",isError: true)
//        } else {
//            if let cat = editCategory {
//                let _ = manager.updateCategory(category: Categories(category: txtQuestion.cleanTrimmedText, id: cat.id))
//            } else {
//                manager.createCategory(category: Categories(category: txtQuestion.cleanTrimmedText, id: UUID()))
//            }
//            self.dismiss(animated: true) {
//                self.newCreated?()
//            }
//        }
    }
    
    @objc func btnActionCancel() {
        self.dismiss(animated: true)
    }
    
    @objc func btnActionAddLink() {
        txtRefLinks.text = ""
        self.view.endEditing(true)
    }
    
    //------------------------------------------------------
}

//extension QuestionsPopupVC: UITextFieldDelegate {
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if string.isBackspace() {
//            return true
//        }
//
//        return true
//    }
//}

extension QuestionsPopupVC: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        viewModel.set(category: viewModel.listRow(for: row))
        txtCategory.text = viewModel.listRow(for: row).category
    }
}

extension QuestionsPopupVC: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        viewModel.numberOfListRow()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        viewModel.listRow(for: row).category
    }
}
