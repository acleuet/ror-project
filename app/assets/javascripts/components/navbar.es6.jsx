class Navbar extends React.Component {

  constructor(props) {
    super(props)
  }


  render() {
    return  <ReactBootstrap.Navbar inverse>
              <ReactBootstrap.Navbar.Header>
                <button type="button" className="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                  <span className="icon-bar"></span>
                  <span className="icon-bar"></span>
                  <span className="icon-bar"></span>
                </button> 
                <a className="navbar-brand" href="#">LOREM IPSUM</a>
              </ReactBootstrap.Navbar.Header>
              <ReactBootstrap.Navbar.Collapse>
                 <ReactBootstrap.Nav pullRight>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 <ReactBootstrap.NavItem href="#">LOREM</ReactBootstrap.NavItem>
                 </ReactBootstrap.Nav>
              </ReactBootstrap.Navbar.Collapse>
            </ReactBootstrap.Navbar>
  }
}