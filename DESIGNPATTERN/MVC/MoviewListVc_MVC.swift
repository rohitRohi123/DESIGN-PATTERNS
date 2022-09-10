//
//  MoviewListVc_MVC.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 04/09/22.
//

import UIKit
import MBProgressHUD

class MoviewListVc_MVC: UIViewController {
    @IBOutlet weak var moviewlistTableView: UITableView!
    
    var movies: [Movie]? = nil {
        didSet {
            self.moviewlistTableView.reloadData()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTableView()
        self.movies(with: "http://localhost:8080/api/movies")
    }

    private func prepareTableView() {
        moviewlistTableView.register(UINib(nibName: "MoviewListCell", bundle: .main), forCellReuseIdentifier: AppConstants.MoviewListCellId)
        moviewlistTableView.tableFooterView = UIView()
        moviewlistTableView.estimatedRowHeight = 141
        moviewlistTableView.rowHeight = UITableView.automaticDimension
        moviewlistTableView.delegate = self
        moviewlistTableView.dataSource = self
    }
}

//MARK: - APIS
extension MoviewListVc_MVC {
    fileprivate func movies(with url: String) {
        MBProgressHUD.showAdded(to: self.view, animated: true)
        self.getMovies(with: url) {[weak self] response in
            switch response {
                case .success(let moviesData):
                    self?.movies = moviesData.movies
                    
                case .failure(let error):
                    debugPrint("Error = \(error)")
            }
        
            guard let `self` = self else {return; }
            MBProgressHUD.hide(for: self.view, animated: true)
        }
        
    }
  
    fileprivate func getMovies(with url: String, completion: @escaping (Result<Movies, NetworkManager.APIError>)->Void) {
        NetworkManager().getRequest(with: url, completionHandler: completion)
        
    }
    
}

//MARK: - UITableViewDelegate & DataSource
extension MoviewListVc_MVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movies?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.MoviewListCellId, for: indexPath) as? MoviewListCell else {
            return UITableViewCell()
        }
        
        if self.movies?.count ?? 0 > indexPath.row,
           let movie = self.movies?[indexPath.row] {
            cell.updateCell(with: movie)
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.movies?.count ?? 0 > indexPath.row,
              let movie = self.movies?[indexPath.row] else {return; }
        
        let moviewDetailsVc = MoviewDetailsVC()
        moviewDetailsVc.movie = movie
        
        self.navigationController?.pushViewController(moviewDetailsVc, animated: true)
    }
}
