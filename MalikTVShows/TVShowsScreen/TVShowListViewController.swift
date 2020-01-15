//
//  TVShowListViewController.swift
//  MalikTVShows
//
//  Created by malikj on 15/01/20.
//  Copyright © 2020 malikj. All rights reserved.
//

import UIKit
import MBProgressHUD

class TVShowListViewController: UIViewController {

    var presenter: TVShowListPresentation?
    var rightBarButton : UIBarButtonItem?
    var loadingNotification: MBProgressHUD?

    @IBOutlet weak var tableView: UITableView!
    private let refreshControl = UIRefreshControl()

    // MARK:- View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        presenter?.loadTVShows()
    }
    
    @objc private func refreshShowsList(_ sender: Any) {
        presenter?.loadTVShows()
    }
    
    @objc func sortClicked(){
        if(rightBarButton?.title == Constants.Titles.Sort) {
            presenter?.sortedShows()
            rightBarButton?.title = Constants.Titles.Clear
        }
        else {
            rightBarButton?.title = Constants.Titles.Sort
            presenter?.clear()
        }
    }
    
    // MARK:- View Setups
    
    func setupUI() {
        setupNavigationTitle()
        setupRefrechControl()
        showLoadingIndicator()
    }
    
    func setupRefrechControl(){
        if #available(iOS 10.0, *) {
            tableView.refreshControl = refreshControl
        } else {
            tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshShowsList), for: .valueChanged)
        refreshControl.tintColor = Constants.Colors.refreshControlColor;
    }
    
    func setupNavigationTitle() {
        self.navigationItem.title = Constants.Titles.Title
        rightBarButton = UIBarButtonItem(title: Constants.Titles.Sort, style: .done, target: self, action: #selector(sortClicked))
        self.navigationItem.rightBarButtonItem  = rightBarButton
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
    }
    
    // MARK:- Network activity indicator views
    
    func showLoadingIndicator()  {
        loadingNotification = MBProgressHUD.showAdded(to: (navigationController?.topViewController?.view)!, animated: true)
        loadingNotification!.mode = MBProgressHUDMode.indeterminate
        loadingNotification!.label.text = "Loading Shows"
    }
    
}

// MARK: - TVShowListViewInterface

extension TVShowListViewController : TVShowListViewInterface {
    
    func refreshTVShows() {
        self.refreshControl.endRefreshing()
        self.loadingNotification?.hide(animated: true)
        tableView.reloadData()
    }
    
    func showLoadingError(errorMessage: String) {
        let alert = UIAlertController(title: "Error", message: "Can not get data.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension TVShowListViewController : UITableViewDelegate, UITableViewDataSource  {
    
    //MARK:Tableview Delegates and Datasource Methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.showCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return Constants.Size.TableViewHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIdentifiers.TVShowTableViewCell, for: indexPath) as! TVShowTableViewCell
        let show = presenter?.show(at: indexPath.row)
        cell.configCell(show)
        return cell
    }
}
    

