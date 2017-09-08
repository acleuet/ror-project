class InfiniteScroll extends React.Component {
  constructor(props) {
    super(props);

    this.state = {
      renderedStart: 0,
      data: props.data,
      itemsCount: props.itemsCount
    }
  }

  onScroll(e) {
    e.stopPropagation();
    this._calculateVisibleItems();
  }

  _calculateVisibleItems() {
    // var scrolledPx = $('.infinite-scroll-content').scrollTop();
    var scrolledPx = ReactDOM.findDOMNode(this).scrollTop;
    var visibleStart = Math.floor(scrolledPx / this.props.itemHeight);

    if (visibleStart !== this.state.renderedStart) {
      this.setState({ renderedStart: visibleStart });
    }
  }

  componentWillReceiveProps(nextProps) {
    var itemsChanged  = this.state.data.length !== nextProps.data.length,
        heightChanged = this.props.height !== nextProps.height;

    if (itemsChanged || heightChanged) {
        this.setState({data: nextProps.data})
        this._calculateVisibleItems();
    }
  }


  componentDidMount() {
    this.state.isInitialRender = false;
    
    setTimeout(() => {
      ReactDOM.findDOMNode(this).scrollTop = this.props.firstVisibleItemIndex * this.props.itemHeight;
    }, 0);
  }

  _getVisibleSlice(items, start, end) {
    let result = [];
    for (let i = start; i < end; i++) {
        result.push(items[i]);
    }
    return result;
  }

  _prepareVisibleItems(itemsPerPage) {
    let visibleStart = this.state.renderedStart,
        visibleEnd = Math.min(this.state.itemsCount, visibleStart + itemsPerPage);

    let visibleItems = this._getVisibleSlice(this.state.data, visibleStart, visibleEnd);

    return visibleItems;
  }

  _getContentStyle(itemsPerPage) {
      var { itemHeight } = this.props;

      var totalHeight = this.state.itemsCount * itemHeight,
          pageHeight = itemsPerPage * itemHeight;

      var maxPadding = Math.max(0, totalHeight - pageHeight + itemHeight),
          padding = this.state.renderedStart * this.props.itemHeight,
          paddingTop = Math.min(maxPadding, padding);

      return {
          height: totalHeight - paddingTop,
          paddingTop: paddingTop
      };
  }

  render(){
    let itemsPerPage = Math.ceil(this.props.height / this.props.itemHeight)+1;
    let visibleItems = this._prepareVisibleItems(itemsPerPage);
    let contentStyle = this._getContentStyle(itemsPerPage);

    return (
        <div onScroll={this.onScroll.bind(this)}
            style={{height: this.props.height}}
            className="infinite-scroll-content">
            <div style={contentStyle}>
                <InfiniteScrollBody data={visibleItems} ClassComponent={this.props.ClassComponent}/>
            </div>
        </div>
    );
  }


}


