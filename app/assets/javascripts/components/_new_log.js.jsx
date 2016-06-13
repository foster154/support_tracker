var NewLog = React.createClass({

	handleClick() {
		var date = this.refs.date.value;
		var person = this.refs.person.value;
		var description = this.refs.description.value;
		$.ajax({
			url: '/api/v1/logs',
			type: 'POST',
			data: { log: { date: date, person: person, description: description } },
			success: (log) => {
				this.props.handleSubmit(log);
			}
		})
		
	},

	render() {
		return (
			<div>
				<input ref="date" placeholder='Date' />
				<input ref="person" placeholder='Person' />
				<input ref="description" placeholder='Description' />
				<button onClick={this.handleClick} className="btn btn-primary">Submit</button>
			</div>
		)
	}

});