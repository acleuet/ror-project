describe('Items', function () {
  
  it('renders a list of item',function(){
    let itemsFixture = DreamItemFixture.setUpItems(3)
    let items = TestUtils.renderIntoDocument(<Items data={itemsFixture}/>)
    let itemComponentsRendered = TestUtils.scryRenderedComponentsWithType(items, Item)
    expect(itemComponentsRendered.length).toEqual(3)

    let itemsTitleNode = TestUtils.findRenderedDOMComponentWithClass(items, 'panel-heading')
    expect(itemsTitleNode.textContent).toEqual('List')
  })

  it('initializes the component state properly',function(){
    let itemsFixture = DreamItemFixture.setUpItems(3)
    let items = TestUtils.renderIntoDocument(<Items data={itemsFixture}/>) 
    expect(items.state.items).toEqual(itemsFixture)
  })

  describe('when the paging option is used', function(){
    it('displays the items without duplicated data', function(){
      let itemsFixture = DreamItemFixture.setUpItems(17)
      let items = TestUtils.renderIntoDocument(<Items data={itemsFixture} page={1}/>) 

      let itemComponentsRendered = TestUtils.scryRenderedComponentsWithType(items, Item)
      expect(itemComponentsRendered.length).toEqual(7)
    })
  })

})