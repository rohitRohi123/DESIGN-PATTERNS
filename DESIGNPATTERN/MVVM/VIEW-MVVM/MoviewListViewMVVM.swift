//
//  MoviewListViewMVVM.swift
//  DESIGNPATTERN
//
//  Created by Rohit Chauhan on 06/09/22.
//

import UIKit
import MBProgressHUD

protocol MovieListViewDelegate: AnyObject {
    func didSelect(movie: Movie)
}

class MoviewListViewMVVM: UIView {
    @IBOutlet weak var moviewList: UITableView!
    var model: (MoviesListViewModelProtocol & LoadingProtocol)?
    
    weak var delegate: MovieListViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        loadContent()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        loadContent()
    }
    
    convenience init(frame: CGRect,
                     model: MoviesListViewModelProtocol & LoadingProtocol) {
        self.init(frame: frame)
        
        self.model = model
        bindModel()
    }
    
    private func bindModel() {
        self.model?.movies?.bind(listener: {[weak self] movies in
            
            if movies != nil {
                self?.moviewList.reloadData() }
            
        })
        
        model?.isLoading.bind(listener: {[weak self] loadingStatus in
            guard let `self` = self,
                  let loadingStatus = loadingStatus else {return; }

            if loadingStatus {
                MBProgressHUD.showAdded(to: self, animated: true)
                return
            }
            
            MBProgressHUD.hide(for: self, animated: true)
        })
        
        (model as? MoviesListViewModel)?.hitApiForMovies(with: "http://localhost:8080/api/movies")
        
    }
    
    private func loadContent() {
        guard let vw = self.loadNib(with: "MoviewListViewMVVM") else {return }
        
        self.addSubview(vw)
        
        vw.translatesAutoresizingMaskIntoConstraints = false
        LayoutEngine().addConstraintsToSuperView(for: vw, and: [.leading(0), .trailing(0), .top(0), .bottom(0)])
        
        prepareTableView()
    }
    
    private func prepareTableView() {
        self.moviewList.register(UINib(nibName: "MoviewListCellMVVM", bundle: .main), forCellReuseIdentifier: AppConstants.MoviewListCellMVVM_CellId)
        self.moviewList.tableFooterView = UIView()
        self.moviewList.estimatedRowHeight = 141
        self.moviewList.rowHeight = UITableView.automaticDimension
        
        self.moviewList.delegate = self
        self.moviewList.dataSource = self
    }
}

//MARK: UITableViewDelegate & UITableViewDataSource
extension MoviewListViewMVVM: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.model?.movies?.value?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppConstants.MoviewListCellMVVM_CellId, for: indexPath) as? MoviewListCellMVVM else {
            return UITableViewCell()
        }
        
        if self.model?.movies?.value?.count ?? 0 > indexPath.row,
           let movie = self.model?.movies?.value?[indexPath.row],
           let model = self.model {
            cell.updateCell(with: model.moviePoster(for: movie),
                            name: model.name(for: movie),
                            rating: model.rating(for: movie),
                            releaseDate: model.releaseDate(for: movie),
                            writer: model.writer(for: movie))
            
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard self.model?.movies?.value?.count ?? 0 > indexPath.row,
              let selectedMovie = self.model?.movies?.value?[indexPath.row] else {return; }
        
        delegate?.didSelect(movie: selectedMovie)
    }
    
}
