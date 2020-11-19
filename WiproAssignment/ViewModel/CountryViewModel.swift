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
}

extension CountryViewModel {
    func getDetails() {
        let request = APIRouter.getDetails
        APIClient.shared.request(request.path, method: request.method, parameters: request.parameters, successClass: APIReponse.self, failureErrorClass: BasicErrorResponseModel.self) { [weak self]  result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let response):
                debugPrint("response", response.title, response.rows.count)
                self.title = response.title
                self.rows = response.rows
            case .failure(let error):
                debugPrint("error", error.localizedDescription)
                self.errorMessage = error.localizedDescription
            }
        }
    }
}
