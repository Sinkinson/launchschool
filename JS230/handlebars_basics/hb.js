let post = {
  title: 'Lorem ipsum dolor sit amet',
  published: '<strong>April 1, 2015</strong>',
  body: 'Sed ut <em>perspiciatis</em> unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit.',
};

let newPost = {
  title: 'test post',
  published: 'April 1, 2020',
  body: 'a small amount of text'
}

post.tags = ['Food', 'Cooking', 'Vegetables'];

let posts = [];
posts.push(post, newPost);

let postsTemplate = Handlebars.compile($('#posts').html());
Handlebars.registerPartial('tag', $('#tag').html());

$(function() {
  $('body').append(postsTemplate({ posts: posts }));
});
