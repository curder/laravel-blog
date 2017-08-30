<div class="column ">
    <div class="card">
        <div class="card-image">
            <figure class="image">
                <a href="{{ $post->url() }}"><img
                            src="{{ $post->cover() }}" alt="blog images"></a>
            </figure>
        </div>
        <div class="card-content">
            <h5 class="title is-6">{{ $post->title }}</h5>
            <a href="{{ $post->categoryId->postUrl() }}" class="tag is-success">{{ $post->categoryId->name }}</a>
            <small>{{ $post->created_at }}</small> {{ $post->views }}
        </div>
    </div>
</div>
