describe('InfiniteScroll', function () {
  describe('when there are more items than the component can display', function(){
    it('only displays five items ',function(){
      let itemsFixture = DreamItemFixture.setUpItems(10)
      let scrollComponent = TestUtils.renderIntoDocument(<InfiniteScroll data={itemsFixture} ClassComponent={Item} itemsCount={10} height={100} itemHeight={20} />)
      let itemComponentsRendered = TestUtils.scryRenderedComponentsWithType(scrollComponent, Item)
      
      expect(itemComponentsRendered.length).toEqual(6)
    })
  })
}) 