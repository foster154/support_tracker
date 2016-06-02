var AllLogs = React.createClass({

	getInitialState() {
	    return {
	        logs: []  
	    };
	},

	componentDidMount() {
	    $.getJSON('/api/v1/logs.json', (response) => { this.setState({ logs: response }) }); 
	},

	render() {
		var logs = this.state.logs.map((log) => {
			return (
				<div key={log.id}>
					<h4>{log.person}</h4>
					<p>{log.description}</p>
				</div>
			)
		});

		return ( 
			<div>
				{logs}
			</div>
		)
	}

});