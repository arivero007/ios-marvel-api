//
//  MarvelAPITests.swift
//  MarvelAPITests
//
//  Created by AlexR on 3/10/21.
//

import XCTest
@testable import MarvelAPI

class CharactersTVCTests: XCTestCase {

    func test_view_canInit(){
        _ = makeSUT()
    }
    
    private func makeSUT() -> CharactersTableViewController{
        let bundle = Bundle(for: CharactersTableViewController.self)
        let sb = UIStoryboard(name: "Main", bundle: bundle)

        let sut = sb.instantiateViewController(withIdentifier: "CharactersTableViewController") as? CharactersTableViewController
        
        XCTAssertNotNil(sut)

        sut!.loadViewIfNeeded()

        return sut!
    }
    
    func test_viewDidLoad_charactersVM() {
        let sut = makeSUT()
        XCTAssertNotNil(sut.charactersVM)
    }
    
    func test_searchBarDelegate_loadsDelegate(){
        let sut = makeSUT()
        XCTAssertIdentical(sut.searchBar.delegate, sut)
    }
    
    func test_tableView_loadsDelegates(){
        let sut = makeSUT()
        XCTAssertIdentical(sut.tableView.delegate, sut)
        XCTAssertIdentical(sut.tableView.dataSource, sut)
    }

}
