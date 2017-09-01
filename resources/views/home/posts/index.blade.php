@extends('home.layouts.app')
@section('page_title','Posts')

@section('banner')
    <div class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <div class="columns">
                    <div class="column">
                        <h1 class="title">
                            <a href="{{ route('posts.index') }}">Posts</a>
                            @if($category->exists)
                                <small>&mdash; {{ $category->name }}</small>
                            @endif
                        </h1>

                        <h2 class="subtitle">
                            @if($category->exists)
                                {!! $category->description !!}
                            @else
                                Please keep learning, do not stop!
                            @endif
                        </h2>
                    </div>

                </div>
            </div>
        </div>
        <div class="hero-foot">
            <div class="container">
                <nav class="tabs is-boxed">
                    <ul>
                        <li class="{{ request()->exists('views') ? '' : ' is-active' }}">
                            <a href="{{ request()->url() }}">Most Recent</a>
                        </li>
                        <li class="{{ request()->exists('views') ? ' is-active' : '' }}">
                            <a href="?views=1">Most Views</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
@endsection
@section('content')
    <nav class="navbar has-shadow">
        <div class="container">
            <div class="navbar-brand">
                @foreach($categories as $cat)
                    <a class="navbar-item is-tab @if($category->exists && $cat->id == $category->id)is-active @endif"
                       href="{{ $cat->postUrl() }}">{{ $cat->name }}</a>
                @endforeach
            </div>
        </div>
    </nav>

    <div class="container post-lists m-t-30">
        @foreach($posts->chunk(3) as $post)
            <div class="columns">
                @foreach($post->take(3) as $p)
                    @include('home.posts._list',['post' => $p])
                @endforeach
            </div>
        @endforeach

        @if(method_exists($posts ,'links'))
            {{ $posts->links('vendor.pagination.simple-bulma')}}
        @endif
    </div>
@endsection
