# README

1. To run the app, install dependencies ruby version '2.7.6', rails version '6.0.0', Postgresql version '9.6'
2. Run the application by the command `rails server`
3. Seed run `rake db:create`, `rake db:migrate`, `rake db:seed` to seed the database
4. The applocation has no FE so we can sign up and sign in an use, but until we are waiting for FE the user is hardcoded,
    for testing purposes
5. In the browser got to http://localhost:3000/graphiql and use next queries:

User:
```
create  user
mutation {
  createUser(input: {
    name: "Test User",
    authProvider: {
      credentials: {
        email: "email1234@example.com",
        password: "123456"
      }
  	}
  }) {
    id
    name
    email
  }
}
==========
mutation {
  signinUser(
    input: {
      credentials: {
        email: "email1234@example.com",
        password: "123456"
      }
  }) {
    token
    user {
    	id
  	}
  }
}
==========
{
  users {
    id
    name
    email
    postsCount
  }
}
==========
find_user
query {
  user(id:5) {
    id
    name
    email
    posts {
      title
    }
  }
}
```
Blogs:
```
mutation {
  createBlog(input: {
    title: "Test Title",
    description: "Test description"
  }) {
      id
      title
    	description
  }
==========
get blog
{
  blog(id:1) {
    title
    posts {
      title
    }
  }
}
```
Post:
```
mutation {
  createPost(input: {
    blogId: 15,
    title: "Test Title",
    body: "Test Body",
    tagIds: [1, 2, 3]
  }) {
      id
      title
    	tags {
        title
      }
    postedBy {
      id
      name
    }
  }
}
==========
get_posts
{
  posts {
    title
    body
    tags {
      title
    }
    user {
      name
    }
  }
}
==========
get posts by title
{
  posts(title: "Test") {
    title
    body
    tags {
      title
    }
    user {
      name
    }
  }
}
==========
get posts by user_id
{
  posts(userId: 2) {
    title
    body
    tags {
      title
    }
    user {
      name
    }
  }
}
==========
get posts_with_pagination
{
  posts(title: "Test", page: 2, limit: 2) {
    title
    body
    createdAt
    tags {
      title
    }
    user {
      name
    }
  }
}
=========
find_post
query {
  post(id:8) {
    title
    body
    tags {
      title
    }
    user {
      name
    }
  }
}
==========
deletePost
mutation {
  deletePost(input: {
   id: 58
  }) {
      success
    	errors
  }
}
==========
updatePost
mutation {
  updatePost(input: {
    id: 57,
    title: "Test Title updated1",
    body: "Test Body updated",
    commentBody: "comment",
    tagIds: []
  }) {
      post {
        id
        title,
        body
      }
    	errors
  }
}
```
Comment:
```
{
  comments(postId: 46, page: 1) {
    body
    user {
      name
    }
  }
}
```
```
mutation {
  createComment(input: {
    body: "Test Comment Body",
    postId: 43
  }) {
      body
    	user {
        name
      }
  }
}
```
6. Everything has been implemented except tests - they will be provided later (will be RSpec), posts filtering by tags has not been completed, for using users' roles and users' tokens we need FE.
