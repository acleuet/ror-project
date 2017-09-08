describe('Item', function () {
  
  it('renders an item',function(){
    let DreamItemFixture = { 
                            id: 1,
                            date: "2017-08-08T00:00:00.000Z",
                            sequences_count: 1,
                            places_count: 2,
                            characters_count: 3
                           }

    let item = TestUtils.renderIntoDocument(<Item data={DreamItemFixture}/>)

    let characterCountNode = TestUtils.findRenderedDOMComponentWithClass(item, 'characters')
    expect(characterCountNode.textContent).toEqual('3')
    let placeCountNode = TestUtils.findRenderedDOMComponentWithClass(item, 'places')
    expect(placeCountNode.textContent).toEqual('2')
    let sequenceCountNode = TestUtils.findRenderedDOMComponentWithClass(item, 'sequences')
    expect(sequenceCountNode.textContent).toEqual('1')
  })
 

})