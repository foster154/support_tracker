var AllLogs = React.createClass({

	render() {
		var logs = this.props.logs.map((log) => {
			return (
				<div key={log.id}>
					<h4></h4>
					<p>{log.date} :: <strong>{log.person}</strong> - {log.description}</p>
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