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
        tbl.backGroundColor(color: .clear)
        tbl.estimatedRowHeight = UITableView.automaticDimension
        tbl.showsVerticalScrollIndicator = false
        tbl.alwaysBounceHorizontal = false
        tbl.alwaysBounceVertical = false
        tbl.separatorStyle = .none
        tbl.register(QuestionsCell.self, forCellReuseIdentifier: QuestionsCell.identifier)
        return tbl
    }()
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
    
    /**
     Basic view setup of the screen.
     */
    private func setUpView() {
        navigationItem.title = "Questions"
        setupDelegates()
    }
    
    private func setupDelegates() {
        tblView.delegate = self
        tblView.dataSource = self
    }
    //------------------------------------------------------
    
    //MARK:- Action Method
    
    
    //------------------------------------------------------
}

// MARK: - Table Delegates & Datasource
extension QuestionVC : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6//viewModel.numberOfListRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: QuestionsCell.identifier) as? QuestionsCell else { return UITableViewCell() }
        cell.configureData()//data: viewModel.listRow(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextvc = CategoryVC()
//        navigationController?.pushViewController(nextvc, animated: true)
    }
}
