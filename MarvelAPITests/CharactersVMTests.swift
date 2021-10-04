//
//  CharactersVMTests.swift
//  MarvelAPITests
//
//  Created by AlexR on 4/10/21.
//

import XCTest
@testable import MarvelAPI

class CharactersVMTests: XCTestCase {

    private func makeSUT() -> CharactersViewModel{
        let sut = CharactersViewModel()
        return sut
    }
    
    func test_filteredArray_isEmpty(){
        let sut = makeSUT()
        XCTAssertTrue(sut.filteredCharacters.isEmpty)
    }
    
    func test_applyFilter(){
        let sut = makeSUT()
        
        loadCharactersOnSut(sut: sut)
        
        sut.applyTextFilter(text: "Ri")

        let filtered = sut.filteredCharacters.first?.name
        let tested = sut.characters.last?.name
        
        XCTAssertNotNil(filtered)
        XCTAssertNotNil(tested)

        XCTAssertTrue(filtered == tested)
    }
    
    func test_filteredArray_equalsCharacters(){
        let sut = makeSUT()
        loadCharactersOnSut(sut: sut)
        XCTAssertEqual(sut.filteredCharacters, sut.characters)
    }
    
    func test_getCharactersWebService_loadDataOnCharacters(){
        let sut = makeSUT()
        
        sut.apiCharacters = MockApiGetCharacters()
        sut.getCharacters()
        
        XCTAssertTrue(sut.characters.count == 2)
    }
    
    private func loadCharactersOnSut(sut: CharactersViewModel){
        sut.characters = [Character(id: 0, name: "Alex", thumbnail: nil, description: "Test1", modified: nil),
                          Character(id: 1, name: "Rivero", thumbnail: nil, description: "Test2", modified: nil)]
    }
    
}
