var CommentsList = React.createClass({
  getInitialState: function() {
    return {comments: this.props.comments}
  },

  handleCommentDelete: function(formData, action) {
    $.ajax({
			data: formData,
			url: action,
			type: "DELETE",
			success: function(data){
        this.props.comments = data.comments;
				this.setState({})
			}.bind(this)
		});
  },

  handleCommentSubmit: function(formData, action) {
    $.ajax({
      data: formData,
      url: "/comments",
      type: "POST",
      success: function(data){
        this.props.comments = data.comments;
        this.setState({})
      }.bind(this)
    });
  },

  render: function() {
    var commentNodes = this.props.comments.map(function(comment) {
      if (this.props.session === comment.user_id) {
        return <CommentWithDelete users={this.props.users} comment={comment} form={this.props.form} onDelete={this.handleCommentDelete} />
      } else {
        return <Comment users={this.props.users} form={this.props.form} comment={comment} />
      }
    }.bind(this));
    return (
      <div id="comments-list">
        <h5>Comments</h5>
        {commentNodes}
        <CommentField form={this.props.form} post={this.props.post} onCommentSubmit={this.handleCommentSubmit} />
      </div>
    )
  }
});

var Comment = React.createClass({
  getInitialState: function() {
    return {vote: this.props.comment.vote}
  },

  handleVote: function(formData) {
    var path = "/comments/" + this.props.comment.id
    $.ajax({
      data: formData,
      url: path,
      type: "PUT",
      success: function(data) {
        this.setState({vote: data.vote});
      }.bind(this)
    });
  },

  render: function() {
    var commentUser
    var comment = this.props.comment
    this.props.users.forEach(function(user) {
      if (comment.user_id === user.id) {
        commentUser = user
      }
    })
    return (
      <div className="comment">
        <p>User: {commentUser.first} {commentUser.last}</p>
        <p>{this.props.comment.text}</p>
        <p>Vote: {this.state.vote}</p>
        <VoteButton form={this.props.form} comment={this.props.comment} onVote={this.handleVote} />
      </div>
    )
  }
});

var CommentWithDelete = React.createClass({
  getInitialState: function() {
    return {vote: this.props.comment.vote}
  },

  handleVote: function(formData) {
    var path = "/comments/" + this.props.comment.id
    $.ajax({
      data: formData,
      url: path,
      type: "PUT",
      success: function(data) {
        this.setState({vote: data.vote});
      }.bind(this)
    });
  },

  render: function() {
    var commentUser
    var comment = this.props.comment
    this.props.users.forEach(function(user) {
      if (comment.user_id === user.id) {
        commentUser = user
      }
    })
    return (
      <div className="comment">
        <p>User: {commentUser.first} {commentUser.last}</p>
        <p>{this.props.comment.text}</p>
        <p>Vote: {this.state.vote}</p>
        <VoteButton form={this.props.form} comment={this.props.comment} onVote={this.handleVote} />
        <CommentDeleteButton comment={this.props.comment} form={this.props.form} onDelete={this.props.onDelete} />
      </div>
    )
  }
});

var CommentDeleteButton = React.createClass({
	handleDelete: function(event) {
		event.preventDefault();
		var formData = $(this.refs.form.getDOMNode()).serialize()
		this.props.onDelete(formData, this.refs.form.props.action);
	},

	render: function() {
		var path = "/comments/"+ this.props.comment.id
		return (
			<form ref="form" action={path} method="POST" onSubmit={this.handleDelete}>
				<input type="hidden" name={this.props.form.csrf_param} value={this.props.form.csrf_token} />
				<input type="hidden" name="_method" value="delete" />
				<button>Delete</button>
			</form>
		);
	}
})

var CommentField = React.createClass({
  handleSubmit: function(event) {
    event.preventDefault();
    var formData = $(this.getDOMNode()).children().serialize()
    this.props.onCommentSubmit(formData, this.props.form.action);
    $(event.target).children().eq(2).val("");
  },

  render: function() {
    return (
      <div id="comment-field">
        <form action={this.props.form.action} method="post" onSubmit={this.handleSubmit} >
          <input type="hidden" name={this.props.form.csrf_param} value={this.props.form.csrf_token} />
          <input type="hidden" name="comment[post_id]" value={this.props.post.id} />
          <input type="post-text" name="comment[text]" placeholder="Post" />
          <button>Comment</button>
        </form>
      </div>
    )
  }
});