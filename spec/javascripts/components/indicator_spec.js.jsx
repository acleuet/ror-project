describe('Indicator', function () {
  
  it('renders the indicator with the right value and label',function(){

    let indicator = TestUtils.renderIntoDocument(<Indicator value={10} label='indicator.characters_added'/>)

    let valueNode = TestUtils.findRenderedDOMComponentWithClass(indicator, 'indicator-value')
    expect(valueNode.textContent).toEqual('10')
    let labelNode = TestUtils.findRenderedDOMComponentWithClass(indicator, 'indicator-label')
    expect(labelNode.textContent).toEqual('characters added')
  })
 

})