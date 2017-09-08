class Items extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
        items: props.data,
        height: 0
    }
    this.updateWindowDimensions = this.updateWindowDimensions.bind(this);
  }

  componentDidMount() {
    this.updateWindowDimensions();
    window.addEventListener('resize', this.updateWindowDimensions);
  }

  componentWillUnmount() {
    window.removeEventListener('resize', this.updateWindowDimensions);
  }

  updateWindowDimensions() {
    this.setState({
       height: 500
    });
  }

  render () {
    let {items, itemsCount} = this._calculatePagingProps()
    return <ReactBootstrap.Panel className="sidebar" header={I18n.t("dream.list")}>
              <ReactBootstrap.ListGroup>
                <InfiniteScroll data ={items}
                                itemsCount = {itemsCount}
                                itemHeight={80}
                                firstVisibleItemIndex={0}
                                height={this.state.height}
                                ClassComponent={Item}
                />
              </ReactBootstrap.ListGroup> 
           </ReactBootstrap.Panel>
  }

  _calculatePagingProps(){
    let items, itemsCount
    if(Number.isInteger(this.props.page)){
      let page = this.props.page
      let numberOfItems = 10
      let startIndex = page*numberOfItems
      items = this.state.items.slice(startIndex, startIndex+numberOfItems)
    }else{
      items = this.state.items
    }

    return {
              items: items,
              itemsCount: items.length
           }
  }
}


