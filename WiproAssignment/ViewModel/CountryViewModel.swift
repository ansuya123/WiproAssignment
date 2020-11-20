//
//  CountryViewModel.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import Foundation

class CountryViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var rows: [Details] = []
    @Published var errorMessage: String = ""
    @Published var showAlert: Bool = false
}

extension CountryViewModel {
    func getDetails() {
        APIClient.shared.getCountyDetails { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                debugPrint("response", response.title, response.rows.count)
                self.title = response.title
                self.rows = response.rows.filter({!($0.imageHref?.isEmpty ?? false) && !($0.title?.isEmpty ?? false) && !($0.description?.isEmpty ?? false)})
            case .failure(let error):
                debugPrint("error", error.localizedDescription)
                self.errorMessage = error.localizedDescription
                self.showAlert = true
            }
        }
    }
}
