@extends('home.layouts.app')
@section('page_title','Posts')
@section('banner')
    <div class="hero is-primary">
        <div class="hero-body">
            <div class="container">
                <div class="columns">
                    <div class="column is-11">
                        <h1 class="title">Posts</h1>
                        <h2 class="subtitle">Please keep learning, do not stop!</h2>
                    </div>
                    <div class="column is-1">
                        <link-add></link-add>
                    </div>
                </div>
            </div>
        </div>
        <div class="hero-foot">
            <div class="container">
                <nav class="tabs is-boxed">
                    <ul>
                        <li class=""><a href="#">Most Recent</a></li>
                        <li class="is-active"><a heaf="#">Most Popular</a></li>
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
                <a class="navbar-item is-tab is-active" href="#">PHP</a>
                <a class="navbar-item is-tab" href="">Javascript</a>
                <a class="navbar-item is-tab" href="">Laravel</a>
                <a class="navbar-item is-tab" href="">HTML/CSS</a>
                <a class="navbar-item is-tab" href="">Services</a>
                <a class="navbar-item is-tab" href="">Others</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="columns">
            @foreach($post->take(3) as $post)
                @include('home.posts._list',['post'=>$post])
            @endforeach
        </div>

        <div class="columns">
            @include('home.posts._list')
            @include('home.posts._list')
            @include('home.posts._list')
        </div>
        <div class="columns">
            @include('home.posts._list')
            @include('home.posts._list')
            @include('home.posts._list')
        </div>
        <div class="columns">
            @include('home.posts._list')
            @include('home.posts._list')
            @include('home.posts._list')
        </div>
        <div class="columns">
            @include('home.posts._list')
            @include('home.posts._list')
            @include('home.posts._list')
        </div>
    </div>
@endsection
