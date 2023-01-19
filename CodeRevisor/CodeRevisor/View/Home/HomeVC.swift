//
//  HomeVC.swift
//  CodeRevisor
//
//  Created by Sanket Parmar on 12/01/23.
//

import UIKit

class HomeVC: UIViewController {
    
    //MARK:- Outlet
    private var addLearning: UIBarButtonItem {
        let add = UIBarButtonItem(
            image: UIImage(systemName: "plus.app.fill"),
            style: .plain,
            target: self,
            action: #selector(addNewLeason))
        add.fontSize(size: 30).tintColor = .primaryText
        return add
    }
    
    private var settings: UIBarButtonItem {
        let setting = UIBarButtonItem(
            image: UIImage(systemName: "gearshape.fill"),
            style: .plain,
            target: self,
            action: #selector(openSettings))
        setting.tintColor = .primaryText
        return setting
    }
    
    private var tblView : UITableView = {
        let tbl = UITableView(frame: CGRect(), style: .grouped)
        tbl.backGroundColor(color: .clear)
        tbl.estimatedRowHeight = UITableView.automaticDimension
        tbl.showsVerticalScrollIndicator = false
        tbl.alwaysBounceHorizontal = false
        tbl.alwaysBounceVertical = false
        tbl.separatorStyle = .none
//        tbl.register(UITableViewCell.self, forCellReuseIdentifier: UITableViewCell.identifier)
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
        view.backgroundColor = .primaryBackground
        navigationItem.title = "HOME"
        navigationController?.setThemeNavigation()
        navigationItem.rightBarButtonItems = [settings, addLearning]
        
        addViews()
    }
    
    private func addViews() {
        view.addSubview(tblView, anchors: [
            .leading(0), .trailing(0),
            .topMargin(0), .bottomMargin(0),
        ])
    }
    
    //------------------------------------------------------
    
    //MARK:- Action Method
    @objc private func addNewLeason() {
        debugPrint("Add button tapped")
    }
    
    @objc private func openSettings() {
        let second = SettingVC()
        self.navigationController?.push(viewController: second)
        debugPrint("Setting button tapped")
    }
    //------------------------------------------------------
}
