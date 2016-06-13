var Main = React.createClass({
	
	getInitialState() {
	    return {
	        logs: []  
	    };
	},

	componentDidMount() {
	    $.getJSON('/api/v1/logs.json', (response) => { this.setState({ logs: response }) }); 
	},

	handleSubmit(log) {
		//var newState = this.state.logs.concat(log);
		//var newState = this.state.logs.unshift(log);
		var newState = this.state.logs;
		newState.unshift(log);
		this.setState({ logs: newState });
	},

	render() {
		return (
			<div>
				<h1>Logs</h1>
				<h3>Served with love via React.js</h3>
				<NewLog handleSubmit={this.handleSubmit} />
				<AllLogs logs={this.state.logs} />
			</div>
		)
	}
	
});