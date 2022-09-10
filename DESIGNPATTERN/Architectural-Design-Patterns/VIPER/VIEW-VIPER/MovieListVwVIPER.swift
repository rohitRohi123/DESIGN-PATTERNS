//
//  MovieListVwVIPER.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 07/09/22.
//

import UIKit
import MBProgressHUD

class MovieListVwVIPER: UIView {
    @IBOutlet weak var movielist: UITableView!
    var presenter: MoviewListPresenter?
    
   private override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadContent()
    }
    
    convenience init(with frame: CGRect, and presenter: MoviewListPresenter) {
        self.init(frame: frame)
        self.presenter = presenter
        
        bindModel()
    }
    
    private func bindModel() {
        self.presenter?.movies?.bind(listener: {[weak self] movies in
            if movies != nil {
                self?.movielist.reloadData()
            }
        })
        
        self.presenter?.isLoading.bind(listener: {[weak self] loadingStatus in
            guard let `self` = self else {return; }
            
            if let status = loadingStatus, status {
                MBProgressHUD.showAdded(to: self, animated: true)
                return
            }
            
            MBProgressHUD.hide(for: self, animated: true)
        })
        
        self.presenter?.requestForMovies()
    }

}

//MARK: - UI Setup
extension MovieListVwVIPER {
    private func loadContent() {
        guard let vw = self.loadNib(with: "MovieListVwVIPER") else {return }
        
        self.addSubview(vw)
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: vw, and: [.leading(0), .trailing(0), .top(0), .bottom(0)])
        
        prepareTableView()
    }
    
    private func prepareTableView() {
        self.movielist.register(UINib(nibName: "MoviewListCellMVVM", bundle: .main), forCellReuseIdentifier: AppConstants.MoviewListCellMVVM_CellId)
        self.movielist.tableFooterView = UIView()
        self.movielist.estimatedRowHeight = 141
        self.movielist.rowHeight = UITableView.automaticDimension
        
        self.movielist.delegate = self
        self.movielist.dataSource = self
    }
    
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension MovieListVwVIPER: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.movies?.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.MoviewListCellMVVM_CellId, for: indexPath) as? MoviewListCellMVVM else {
            return UITableViewCell()
        }
        
        if self.presenter?.movies?.value?.count ?? 0 > indexPath.row,
           let movie = self.presenter?.movies?.value?[indexPath.row],
           let presenter = self.presenter {
            cell.updateCell(with: presenter.moviePoster(for: movie),
                            name: presenter.name(for: movie),
                            rating: presenter.rating(for: movie),
                            releaseDate: presenter.releaseDate(for: movie),
                            writer: presenter.writer(for: movie))

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.presenter?.movies?.value?.count ?? 0 > indexPath.row,
              let selectedMovie = self.presenter?.movies?.value?[indexPath.row] else {return; }
        self.presenter?.didSelect(movie: selectedMovie)
    }
    
}
