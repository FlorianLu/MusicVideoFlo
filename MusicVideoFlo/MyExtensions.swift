//
//  MyExtensions.swift
//  MusicVideoFlo
//
//  Created by Florian LUDOT on 27/07/16.
//  Copyright © 2016 Florian LUDOT. All rights reserved.
//

import UIKit

extension MusicVideoTVC : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        searchController.searchBar.text!.lowercaseString
        filterSearch(searchController.searchBar.text!)
    }
}