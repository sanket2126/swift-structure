//
//  QuestionVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 20/01/23.
//

import UIKit

class QuestionVC: UIViewController {
    
    //MARK:- Outlet
    private var tblView : UITableView = {
        let tbl = UITableView(frame: CGRect(), style: .grouped)
        tbl.backGroundColor(color: .primaryBackground)
        tbl.estimatedRowHeight = UITableView.automaticDimension
        tbl.showsVerticalScrollIndicator = false
        tbl.alwaysBounceHorizontal = false
        tbl.alwaysBounceVertical = false
        tbl.separatorStyle = .none
        tbl.register(QuestionsCell.self, forCellReuseIdentifier: QuestionsCell.identifier)
        return tbl
    }()
    
    private var addLearning: UIBarButtonItem {
        let add = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(addNewLeason))
        add.fontSize(size: 30).tintColor = .primaryText
        return add
    }
    //------------------------------------------------------
    
    //MARK:- Class Variable
    private var selectedCategory: Categories!
    //------------------------------------------------------
    
    //MARK:- Life Cycle Method
    init(category: Categories!) {
        self.selectedCategory = category
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
    
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        navigationItem.title = "\(selectedCategory.category) questions"
        navigationItem.rightBarButtonItems = [addLearning]
        setConstrains()
        setupDelegates()
    }
    
    private func setConstrains() {
        view.addSubview(tblView, anchors: [
            .leading(0), .trailing(0),
            .top(0), .bottom(0)
        ])
        
    }
    
    private func setupDelegates() {
        tblView.delegate = self
        tblView.dataSource = self
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc private func addNewLeason() {
//        let nextvc = GeneralPopupVC()
//        nextvc.modalPresentationStyle = .overCurrentContext
//        nextvc.modalTransitionStyle = .crossDissolve
//        self.present(nextvc, animated: true)
    }
    
    //------------------------------------------------------
}

// MARK: - Table Delegates & Datasource
extension QuestionVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12//viewModel.numberOfListRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionsCell.identifier) as? QuestionsCell else { return UITableViewCell() }
        cell.configureData()//data: viewModel.listRow(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
