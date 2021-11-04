import * as React from "react"


interface IHelloWorldProps {
  greeting: string;
}

interface IHelloWorldState {
}

class HelloWorld extends React.Component <IHelloWorldProps, IHelloWorldState> {
  render() {
    return (
      <React.Fragment>
        Greeting: {this.props.greeting}
      </React.Fragment>
    );
  }
}

export default HelloWorld
