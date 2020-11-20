//
//  CountryView.swift
//  WiproAssignment
//
//  Created by Anasuya Polu on 2020-11-19.
//

import SwiftUI

struct CountryView: View {
    @ObservedObject private var viewModel: CountryViewModel
    
    func removeTableViewExtraSpaceBgColorAndSeprator() {
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect.zero)
        UITableView.appearance().tableFooterView = UIView(frame: CGRect.zero)
        UITableView.appearance().separatorStyle = .none
        UITableViewHeaderFooterView.appearance().tintColor = UIColor.clear
        UITableViewCell.appearance().selectionStyle = .none
        UITableViewCell.appearance().accessoryType = .none
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
    }
    
    init(viewModel: CountryViewModel) {
        self.viewModel = viewModel
        self.removeTableViewExtraSpaceBgColorAndSeprator()
    }
    var body: some View {
        VStack(spacing: 0) {
            self.showTitle()
            self.showList()
        }
        .edgesIgnoringSafeArea(.all)
        .background(WColors.ViewBackgroundColor)
        .alert(isPresented: self.$viewModel.showAlert) {
            Alert(title: Text(""), message: Text(self.viewModel.errorMessage), dismissButton: .default(Text("Ok")))
        }
        .onAppear {
            self.viewModel.getDetails()
        }
    }
    
    private func showTitle() -> some View {
        return  HStack(spacing: 10) {
            Text("").frame(width: 44, height: 44, alignment: .center)
                .padding(.leading, 10)

            Spacer()
            Text(self.viewModel.title)
                .font(.system(size: 18, weight: .bold, design: .default))
                .foregroundColor(WColors.Black)
                .padding(.top, 20)
                .clipped()
            Spacer()
            Button(action: {
                self.viewModel.getDetails()
            }, label: {
                Image(systemName: "arrow.2.circlepath")
                    .renderingMode(.template)
                    .padding(10)
                    .foregroundColor(WColors.Black)
                    .padding(.top, 20)
            })
            .frame(width: 44, height: 44, alignment: .center)
            .padding(.trailing, 10)
        }
        .frame(width: UIScreen.main.bounds.size.width, height: 64, alignment: .center)
        .background(WColors.White)
        .shadow(color: WColors.Black16.opacity(0.16), radius: 4, x: 0, y: 3)
    }
    
    private func showList() -> some View {
        return VStack {
            List {
                ForEach(self.viewModel.rows, id: \.id) { details in
                    DetailsRow(details)
                        .listRowBackground(WColors.ViewBackgroundColor)
                }
            }
            .listStyle(PlainListStyle())
        }
    }
}
